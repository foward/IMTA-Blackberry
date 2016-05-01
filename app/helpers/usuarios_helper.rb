module UsuariosHelper

  def tipo_usuario(rol)
    if rol == 0
      return "Administrador"
    end
    if rol == 1
      return "Jefe Técnico"
    end
    if rol == 2
      return "Técnico"
    end
    if rol == 3
      return "Cliente"
    end
  end

  def capacidad_tecnica(capacidad)
    if capacidad == 0
      return "Electromécanico"
    end
    if capacidad == 1
      return "Mecanico"
    end
    if capacidad == 2
      return "Electronico"
    end
    if capacidad == 3
      return "T. Especialista - Sistemas Hidraulicos"
    end
    if capacidad == 4
      return "T. Especialista - Generadores"
    end
    if capacidad == 5
      return "T. Especialista - Tornos"
    end
    if capacidad == 6
      return "T. Especialista - CNC"
    end
  end
  
end
