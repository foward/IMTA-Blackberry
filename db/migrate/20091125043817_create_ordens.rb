class CreateOrdens < ActiveRecord::Migration
  def self.up
    create_table :ordens do |t|
      t.integer :tipo_orden
      t.integer :numero_orden
      t.datetime :fecha_apertura
      t.datetime :fecha_cierre
      t.text :estado
      t.text :comentario_inicial
      t.text :comentario_final
      t.text :comentario_jefe
      t.time :hora_inicial
      t.time :hora_termino
      t.datetime :fecha_visita
      t.integer :maquina_id
      t.integer :usuario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ordens
  end
end
