class Notificador < ActionMailer::Base
  

  def registro(usuario)
    subject    'Registro de Usuario'
    recipients usuario.email
    from       'no-responder@techmotion.com'
    sent_on    Time.now
    
    body       :usuario => usuario
  end

  def nueva_tarea(usuario)
    subject    'Se le Ha asignado una nueva Orden de Trabajo'
    recipients usuario.email
    from       'no-responder@techmotion.com'
    sent_on    Time.now

    body       :usuario => usuario
  end

end
