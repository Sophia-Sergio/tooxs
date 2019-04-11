class Tooxs::UserAccessMailer < ActionMailer::Base
  default from: 'hello@tooxs.com'
  default reply_to: 'no-reply@tooxs.com'
  default subject: 'Usuarios que han accedido'

  def user_access
    @users_count = params[:users_count]
    mail(to: 'cas@codigonet.net')
  end
  
end
