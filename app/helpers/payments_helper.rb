module PaymentsHelper
  def payment_method_menu(selected, opt={paid: true, unpaid: true})
    meths = Cart::PAYMENT_METHODS.map { |m| [t("shop.payment.method.#{m}"), m] }
    meths.unshift [t("shop.payment.status.paid"), "paid"] if opt[:paid]
    meths.push [t("shop.payment.status.unpaid"), "unpaid"] if opt[:unpaid]
    options_for_select(meths, selected)
  end

  def card_mm_menu
    months = (1..12).map { |m| "%02d" % m }
    months.unshift [t("shop.payment.card.mm"), ""]
    options_for_select(months)
  end

  def card_yyyy_menu
    year = Date.today.year
    years = 11.times.each_with_object([]) { |d, a| y = year + d; a.push [y, y] }
    years.unshift [t("shop.payment.card.yyyy"), ""]
    options_for_select(years)
  end

  # @param item [Item]
  def description_in_cart(item)
    if item.section.present?
      "#{item.description} #{item.section}"
    else
      item.description
    end
  end
end
