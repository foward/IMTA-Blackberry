# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def maquina(maquina_id)

    @maquina = Maquina.find(maquina_id)
    return @maquina.marca

  end


  def empresa(cliente_id)

    @cliente = Usuario.find(cliente_id)
    return @cliente.empresa
  end

    def usuario(usuario_id)

    @usuario = Usuario.find(usuario_id)
    return  @usuario.nombre_completo
  end


  def cliente(cliente_id)

    @cliente = Usuario.find(cliente_id)
    return @cliente.empresa
  end

  def format_date(date)
    I18n.l date, :format =>  :short
  end


  def tipo_orden(tipo_orden)
    if tipo_orden == 0
      return "Mantención Predictiva"
    end
    if tipo_orden == 1
      return "Mantención Correctiva"
    end
    if tipo_orden == 2
      return "Garantía"
    end
  end



  def tipo_cliente(tipo)
    if tipo == 0
      return "Mantención Predictiva"
    end
    if tipo == 1
      return "Mantención Correctiva"
    end
    if tipo == 2
      return "Garantía"
    end
  end

  def maquina_area(maquina_id)
    if maquina_id.nil?
      return "No existe la máquina"
    else
      @maquina = Maquina.find(maquina_id)
      return @maquina.marca
    end

  end




end
