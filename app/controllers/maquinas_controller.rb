class MaquinasController < ApplicationController
  # GET /maquinas
  # GET /maquinas.xml
  def index

    
    if  self.usuario_en_sesion.cliente?
      # @maquinas = Maquina.find(:all,:conditions => ["usuario_id = ?",self.usuario_en_sesion.id ])
      @maquinas= self.usuario_en_sesion.maquinas
    else
      if params[:cliente_id] != nil
        @maquinas = Maquina.find(:all,:conditions => ["usuario_id = ?", params[:cliente_id]])
      else
        @maquinas = Maquina.find(:all, :order => "usuario_id DESC" )
        @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:group => "rut",:order => "updated_at DESC")
      end
     
    end
  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maquinas }
    end
  end

  def listar
    if params[:maquina] != nil
      @maquinaTemp = Maquina.new(params[:maquina])
      @maquinas = Maquina.find(:all,:conditions => ["usuario_id = ?", @maquinaTemp.usuario_id])
    end


  end


  # GET /maquinas/1
  # GET /maquinas/1.xml
  def show
    @maquina = Maquina.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maquina }
    end
  end

  # GET /maquinas/new
  # GET /maquinas/new.xml
  def new
    @maquina = Maquina.new
    @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:order => "updated_at DESC", :offset => 5)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @maquina }
    end
  end

  # GET /maquinas/1/edit
  def edit
    @maquina = Maquina.find(params[:id])
    @clientes =  Usuario.find_all_by_tipo_usuario(Usuario::CLIENTE,:order => "updated_at DESC", :offset => 5)
  end

  # POST /maquinas
  # POST /maquinas.xml
  def create


    @maquina = Maquina.new(params[:maquina])
    

    #self.usuario_en_sesion
    respond_to do |format|
      if @maquina.save
        flash[:notice] = 'La Máquina fue exitosamente creada.'
        format.html { redirect_to(:action => "show", :id => @maquina) }
        format.xml  { render :xml => @maquina, :status => :created, :location => @maquina }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @maquina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maquinas/1
  # PUT /maquinas/1.xml
  def update
    @maquina = Maquina.find(params[:id])

    respond_to do |format|
      if @maquina.update_attributes(params[:maquina])
        flash[:notice] = 'La Máquina fue exitosamente actualizada.'
        format.html {  redirect_to(:action => "show", :id => @maquina) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @maquina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maquinas/1
  # DELETE /maquinas/1.xml
  def destroy
    @maquina = Maquina.find(params[:id])
    @maquina.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "index") }
      format.xml  { head :ok }
    end
  end
end
