class Usuario < ActiveRecord::Base

  has_many :maquinas

  has_many:peticions

  
  # Tipo de Usuario
  ADMIN = 0.freeze
  JEFE_TECNICO = 1.freeze
  TECNICO = 2.freeze
  CLIENTE = 3.freeze

  ROLES = [
    [ "Administrador", ADMIN ],
    [ "Jefe Técnico", JEFE_TECNICO ],
    [ "Técnico", TECNICO ],
    [ "Cliente", CLIENTE ]
  ].freeze

  #  <%= select( "usuario", "capacidad_tecnica", { "Electromecanico" => "0", "Mecanicos" => "1",
  #  "Electronicos" => "2","Especialista- Sistemas Hirdaulicos" => "3",
  #   "Especialista- Generadores" => "4" , "Especialista- Tornos" => "5","Especialista- CNC" => "6"  }) %>

  ELECTROMECANICO = 0.freeze
  MECANICO = 1.freeze
  ELECTRONICO = 2.freeze
  HIDRAULICO = 3.freeze
  GENERADORES = 4.freeze
  TORNOS = 5.freeze
  CNC = 6.freeze

  CAPACIDADES = [
    [ "Electromécanico", ELECTROMECANICO ],
    [ "Mecanico", MECANICO ],
    [ "Electronico", ELECTRONICO ],
    [ "T. Especialista - Sistemas Hidraulicos", HIDRAULICO ],
    [ "T. Especialista - Generadores", GENERADORES ],
    [ "T. Especialista - Tornos", TORNOS ],
    [ "T. Especialista - CNC", CNC ]
  ].freeze


  validates_presence_of :usuario, :nombres, :apellidos, :rut , :email
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :usuario
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  # Retorna el nombre completo de la persona. Ejemplo: Jose Antonio Silva Portell.
  def nombre_completo
    return "#{self.nombres} #{self.apellidos}"
  end

  # Retorna el nombre abreviado de la persona. Ejemplo: Jose Antonio S.
  def nombre_abreviado
    return "#{self.nombres} #{self.apellidos[0,1]}."
  end

  # Retorna true si el usuario es administrador
  def admin?
    return self.tipo_usuario == ADMIN
  end

  # Retorna true si el usuario es administrador de una cuenta
  def jefe_tecnico?
    return self.tipo_usuario== JEFE_TECNICO
  end

  # Retorna true si el usuario es administrador de una cuenta
  def tecnico?
    return self.tipo_usuario== TECNICO
  end

  # Retorna true si el usuario es administrador de una cuenta
  def cliente?
    return self.tipo_usuario== CLIENTE
  end

  def soy_yo?(usuario_a_verificar)
    if !usuario_a_verificar.nil?
      return self.id == usuario_a_verificar.id
    end
    return false
  end

end
