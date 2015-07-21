class UserNotifier < ApplicationMailer
  default :from => 'codebytesapp@gmail.com'

  # no-reply@codebytes.com

  # send a signup email to the user, pass in the user object that containes the user's email address.
  def send_signup_confirmation_email(user)
    @user = user
    mail( :to => user.email,
          :subject => "Thanks for signing up for CodeBytes! We're glad you're here!")
  end
end
