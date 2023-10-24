class AccountMailer < ApplicationMailer
  default from: 'from@example.com'

  def verification_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Registration Confirmation')
  end

  def forgot_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Reset your password')
  end
end
