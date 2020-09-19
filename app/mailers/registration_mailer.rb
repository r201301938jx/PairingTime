class RegistrationMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def send_mail(customer)
    @customer = customer
    mail to: customer.email, subject: "[PairingTime]会員新規登録完了のご連絡"
  end
end
