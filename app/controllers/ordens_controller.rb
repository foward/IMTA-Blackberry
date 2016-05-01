class OrdensController < ApplicationController
  # GET /ordens
  # GET /ordens.xml
  def index
    @ordens = Orden.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordens }
    end
  end

  def agenda
    @ordens = Orden.find(:all,:conditions => ["usuario_id = ?", params[:tecnico_id]])
  end

  def mapa
    
  end

  # GET /ordens/1
  # GET /ordens/1.xml
  def show
    @orden = Orden.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orden }
    end
  end

  # GET /ordens/new
  # GET /ordens/new.xml
  def new
    @orden = Orden.new
    @maquina = Maquina.find(params[:maquina_id])
    @tecnicos = Usuario.find(:all,:conditions => ["tipo_usuario = ? and capacidad_tecnica = ? ", Usuario::TECNICO, @maquina.tipo_area_tecnica ])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orden }
    end
  end

  # GET /ordens/1/edit
  def edit
    @orden = Orden.find(params[:id])
    @tecnicos =  Usuario.find_all_by_tipo_usuario(Usuario::TECNICO,:order => "updated_at DESC", :offset => 5)
    @maquina = Maquina.find(@orden.maquina_id)
  end


  def iniciar
    @orden = Orden.find(params[:id])
    @tecnicos =  Usuario.find_all_by_tipo_usuario(Usuario::TECNICO,:order => "updated_at DESC", :offset => 5)
    @maquina = Maquina.find(@orden.maquina_id)
  end

  # POST /ordens
  # POST /ordens.xml
  def create
    @orden = Orden.new(params[:orden])
    @usuario = Usuario.find(@orden.usuario_id)
    respond_to do |format|
      if @orden.save
        flash[:notice] = 'La Orden de Trabajo fue exitosamente generada.'
         Notificador.deliver_nueva_tarea(@usuario)
        format.html { redirect_to(:action => "show", :id => @orden) }
        format.xml  { render :xml => @orden, :status => :created, :location => @orden }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @orden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordens/1
  # PUT /ordens/1.xml
  def update
    @orden = Orden.find(params[:id])

    respond_to do |format|
      if @orden.update_attributes(params[:orden])
        flash[:notice] = 'La orden fue exitosamente actualizada'
        format.html { redirect_to(:action => "show", :id => @orden) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @orden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1
  # DELETE /ordens/1.xml
  def destroy
    @orden = Orden.find(params[:id])
    @orden.destroy

    respond_to do |format|
      format.html {  redirect_to(:action => "index") }
      format.xml  { head :ok }
    end
  end
end
