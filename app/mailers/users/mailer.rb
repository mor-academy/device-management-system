class Users::Mailer < ApplicationMailer
  def office_change user
    @user = user
    mail to: @user.email, subject: t(".subject")
  end

  def provide_password email, password
    @password = password
    mail to: email, subject: t(".subject")
  end
end
