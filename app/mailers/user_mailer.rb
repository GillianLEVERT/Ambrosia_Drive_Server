class UserMailer < ApplicationMailer
  def magic_link(user, login_link)
    @user = user
    @login_link  = login_link
    mail to: @user.email, subject: 'Connexion sur notre site.'
  end
end