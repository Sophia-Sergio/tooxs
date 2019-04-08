class Tooxs::PasswordMailer < Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    opts[:reply_to] = 'no-reply@tooxs.com'
    opts[:subject] = 'Instrucciones para recuperar tu contraseña'
    super(record, token, opts)
  end
  
end
