# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_email
  def welcome_email
    UserMailer.welcome_email(User.first, ["drake @ barclays", "bon iver @ music hall of williamsburg"])
  end

end
