class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user
    @this_weeks_events = user.upcoming_events
    @remaining_events = user.remaining_events
    mail to: @user.email
  end
end
