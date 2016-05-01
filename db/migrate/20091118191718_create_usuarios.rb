class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombres, :limit =>150
      t.string :apellidos, :limit =>150
      t.string :usuario, :limit => 40, :default => "", :null => false
      t.string :password, :limit => 40, :default => "", :null => false
      t.integer :capacidad_tecnica
      t.integer :tipo_usuario
      t.string :rut
      t.string :telefono_movil, :limit => 50
      t.string :telefono_oficina, :limit => 50
      t.string :telefono_fax, :limit => 50
      t.string :email, :limit =>250
      t.string :representante
      t.string :empresa
      t.string :direccion
      t.string :numero, :limit => 10
      t.string :ciudad
      t.string :comuna
      t.string :foto_path
      t.text :estado_tecnico
      t.string :authtoken
      t.timestamp :access
      t.timestamp :last_access
      t.integer :logins, :limit =>10, :default => 0, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
