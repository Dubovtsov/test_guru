class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def send_mail
    @email = params[:email]
    @body = params[:body]
    FeedbacksMailer.send_feedback(@email, @body).deliver_now

    redirect_to root_path, notice: 'Message sent'
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email)
  end

end
