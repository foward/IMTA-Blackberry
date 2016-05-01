class CreateMaquinas < ActiveRecord::Migration
  def self.up
    create_table :maquinas do |t|
      t.string :marca
      t.string :modelo
      t.string :num_serie
      t.text :descripcion
      t.integer :tipo_area_tecnica
      t.datetime :fecha_compra
      t.datetime :fecha_termino_garantia
      t.string :foto_1
      t.string :foto_2
      t.string :video_1
      t.string :video_2
      t.string :codigo_interno
      t.references :usuario

      t.timestamps
    end
  end

  def self.down
    drop_table :maquinas
  end
end
