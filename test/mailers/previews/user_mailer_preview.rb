# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_email
  def welcome_email
    @user = User.find 15
    UserMailer.welcome_email(@user)
  end

  def subscription_email
    @user = User.find 15
    UserMailer.subscription_email(@user)
  end

end
