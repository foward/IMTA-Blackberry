# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "principal"

  # Filtro de contexto. Mantiene actualizado el valor del actual usuario en sesion.
  before_filter {|c| c.usuario_en_sesion = Usuario.find(c.session[:usuario_id]) if c.session[:usuario_id]}

  before_filter :autorizar
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
 

  # Accesor que guarda el valor del usuario actualmente en sesion.
  attr_accessor :usuario_en_sesion

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  def autorizar
    unless self.usuario_en_sesion
      flash[:error] = "Debe ingresar al sistema para tener acceso a esta sección"
      redirect_to :controller => 'clientes', :action => 'ingreso'
      return false
    end
    return true
  end



  
end
