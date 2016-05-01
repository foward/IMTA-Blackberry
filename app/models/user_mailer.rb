class UserMailer < ActionMailer::Base

  def welcome_email(usuario)
    recipients usuario.email
    from "My Awesome Site Notifications <notifications@example.com>"
    subject "Welcome to My Awesome Site"
    sent_on Time.now
    body :usuario => usuario, :url => "http://example.com/login"
    content_type "text/html" 
  end 


end
