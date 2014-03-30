class IcuMailer < ActionMailer::Base
  add_template_helper(CartsHelper)

  FROM = "NO-REPLY@icu.ie"
  CONFIRMATION = "Confirmation of your Payment to the ICU"

  default from: FROM

  def test_email(to, subject, message)
    raise "'#{to}' is not a valid email address" unless Util::Mailgun.validate(to)
    @message = message
    @time = Time.now.to_s(:nosec)
    mail(to: to, subject: subject)
  end

  def payment_receipt(cart_id)
    @cart = Cart.find(cart_id)
    mail(to: payment_receipt_to(@cart), subject: CONFIRMATION)
  end

  private

  def payment_receipt_to(cart)
    to = cart.confirmation_email
    unless Rails.env.test? || to.blank?
      raise "invalid confirmation email (#{to})" unless Util::Mailgun.validate(to)
    end
    Rails.env.development? || to.blank? ? "webmaster@icu.ie" : to
  end
end
