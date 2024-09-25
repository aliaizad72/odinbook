class UserMailer < ApplicationMailer
  default from: "confirmation@odinbook.com"

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to Odinbook, #{@user.username}!")
  end
end
