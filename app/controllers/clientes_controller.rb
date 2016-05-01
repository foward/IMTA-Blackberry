class ClientesController < ApplicationController
  skip_before_filter :autorizar, :only => ['index','ingreso', 'ingresar','salir']

  def index
  end

  def ingreso
    @usuario = Usuario.new
  end

  def ingresar
    @usuario = Usuario.new(params[:userform])
    usuario_valido = Usuario.find(:first, :conditions => ["usuario = ? and password=?", @usuario.usuario, @usuario.password])
    
    # subsequent requests
    if usuario_valido
      session[:usuario_id] = usuario_valido.id
      flash[:notice] = "Ha ingresado al sistema exitosamente"
      redirect_to :controller => 'site', :action => 'index'
    else
      flash[:error] = "No se permite su ingreso."
      redirect_to(:action => "ingreso")

    end
  end

  def salir
    session[:usuario_id] = nil
    flash[:notice] = "Exitosamente se retiro de sistema"
    redirect_to(:action => "ingreso")
  end

end
