class UsuariosController < ApplicationController




  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

 

  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end


  def new
    @usuario = Usuario.new
  


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  def mi_perfil
    @usuario = self.usuario_en_sesion
  end


  def edit
    @usuario = Usuario.find(params[:id])
  end


  def create
    @usuario = Usuario.new(params[:usuario])
  uploaded_io = params[:usuario][:foto_path]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end 
    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'El Usuario fue satisfactoriamente creado.'
        Notificador.deliver_registro(@usuario)
        format.html { redirect_to(:action => "show", :id => @usuario) }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'El usuario fue satisfactoriamente actualizado.'
        format.html { redirect_to(:action => "show", :id => @usuario) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    flash[:notice] = 'El usuario fue eliminado'
    respond_to do |format|
      format.html {  redirect_to(:action => "index")  }
      format.xml  { head :ok }
    end
  end



  def capacidad_to_numero(capacidad)
    if capacidad == Usuario::ELECTROMECANICO
      return 0
    end
    if capacidad == Usuario::MECANICO
      return 1
    end
    if capacidad == Usuario::ELECTRONICO
      return 2
    end
    if capacidad == Usuario::HIDRAULICO
      return 3
    end
    if capacidad == Usuario::GENERADORES
      return 4
    end
    if capacidad == Usuario::TORNOS
      return 5
    end
    if capacidad == Usuario::CNC
      return 6
    end
  end

  def tecnicos
    if params[:capacidad].nil?
      @usuarios = Usuario.find_all_by_tipo_usuario(Usuario::TECNICO,:order => "capacidad_tecnica DESC", :offset => 5)
    else
      @usuarios = Usuario.find(:all,:conditions => ["tipo_usuario = ? and capacidad_tecnica=?", Usuario::TECNICO, params[:capacidad]])
    end
    
  end

  def clientes
      @usuarios = Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:order => "updated_at DESC", :offset => 5)
  end


end
