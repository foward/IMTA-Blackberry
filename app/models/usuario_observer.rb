class UsuarioObserver < ActiveRecord::Observer

  def after_create(usuario)
    #UserMailer.deliver_welcome_email(usuario)
  end
  
end