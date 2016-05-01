class Maquina < ActiveRecord::Base
  belongs_to :clientes, :class_name => "Usuario",:conditions => ['tipo_usuario = ?', Usuario::CLIENTE],
                     :foreign_key => "usuario_id"

  has_many:peticions



  
end
