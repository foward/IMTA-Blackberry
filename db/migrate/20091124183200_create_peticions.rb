class CreatePeticions < ActiveRecord::Migration
  def self.up
    create_table :peticions do |t|
      t.text :comentario
      t.datetime :fecha_recepcion
      t.integer :maquina_id
      t.integer :usuario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :peticions
  end
end
