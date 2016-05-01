class Peticion < ActiveRecord::Base

  # una peticion de trabajo pertenece a una maquina
  # una maquina tiene muchas peticiones de trabajo
  belongs_to :maquina, :class_name => "Maquina",:foreign_key => "maquina_id"

  #una peticion de trabajo pertenece a un cliente
  #un cliente tiene muchas peticiones de trabajo
  belongs_to :usuario,:conditions => ['tipo_usuario = ?', Usuario::CLIENTE],
    :foreign_key => "usuario_id"
  
end
