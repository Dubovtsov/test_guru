class FeedbacksMailer < ApplicationMailer
  def send_feedback(email, body)
    @admin_email = 'dubwin@yandex.ru'
    @email = email
    @body = body

    # mail from: email, subject: 'Contact Request'
    mail to: @admin_email
  end
end
