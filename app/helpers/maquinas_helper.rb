module MaquinasHelper

  def maquina_es_de(usuario_id)
    if usuario_id.nil?
      return "No tiene empresa asociada"
    else
          @usuario = Usuario.find(usuario_id)
          return @usuario.empresa
    end

  end
end
