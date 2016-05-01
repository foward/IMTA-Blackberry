class PeticionsController < ApplicationController
  # GET /peticions
  # GET /peticions.xml
  def index


    if  self.usuario_en_sesion.cliente?
      # @maquinas = Maquina.find(:all,:conditions => ["usuario_id = ?",self.usuario_en_sesion.id ])
      @peticions= self.usuario_en_sesion.peticions
    else
      if params[:cliente_id] != nil
        @peticions= Peticion.find(:all, :order => "created_at DESC",:conditions => ["usuario_id = ?", params[:cliente_id]])
      else
        @peticions = Peticion.find(:all, :order => "created_at DESC" )
        @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:group => "rut",:order => "updated_at DESC")
        
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @peticions }
    end
  end

  # GET /peticions/1
  # GET /peticions/1.xml
  def show
    @peticion = Peticion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @peticion }
    end
  end

  # GET /peticions/new
  # GET /peticions/new.xml
  def new
    @peticion = Peticion.new
    @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:order => "updated_at DESC",:group => "rut", :offset => 5)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @peticion }
    end
  end

  # GET /peticions/1/edit
  def edit
    @peticion = Peticion.find(params[:id])
    @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:order => "updated_at DESC",:group => "rut", :offset => 5)
  end

  # POST /peticions
  # POST /peticions.xml
  def create
    @peticion = Peticion.new(params[:peticion])
    @peticion.usuario = self.usuario_en_sesion
    @maquina = Maquina.find(@peticion.maquina_id)
    @peticion.maquina = @maquina
    
    respond_to do |format|
      if @peticion.save
        flash[:notice] = 'La Petición fue exitosamente enviada'
        format.html { redirect_to(:action => "show", :id => @peticion) }
        format.xml  { render :xml => @peticion, :status => :created, :location => @peticion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @peticion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /peticions/1
  # PUT /peticions/1.xml
  def update
    @peticion = Peticion.find(params[:id])

    respond_to do |format|
      if @peticion.update_attributes(params[:peticion])
        flash[:notice] = 'La petición fue exitosamente actualizada'
        format.html { redirect_to(:action => "show", :id => @maquina) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @peticion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /peticions/1
  # DELETE /peticions/1.xml
  def destroy
    @peticion = Peticion.find(params[:id])
    @peticion.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "index") }
      format.xml  { head :ok }
    end
  end
end
