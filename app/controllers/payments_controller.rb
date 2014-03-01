class PaymentsController < ApplicationController
  def shop
    @subscription_fees = SubscriptionFee.on_sale.ordered
    @entry_fees = EntryFee.on_sale.ordered
    @completed_carts = completed_carts
  end

  def cart
    redirect_to shop_path unless check_cart(:create)
  end

  def card
    redirect_to shop_path unless check_cart { !@cart.cart_items.empty? }
  end

  def charge
    if check_cart { !@cart.cart_items.empty? && request.xhr? }
      @cart.purchase(params, current_user)
      complete_cart(@cart.id) if @cart.paid?
    else
      if request.xhr?
        render nothing: true
      else
        redirect_to shop_path
      end
    end
  end

  def confirm
    @cart = last_completed_cart
    redirect_to shop_path unless @cart
  end

  def completed
    @completed_carts = completed_carts
  end

  private

  def check_cart(option=nil)
    @cart = current_cart(option)
    @cart && (!block_given? || yield)
  end
end
