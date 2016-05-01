# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091125043817) do

  create_table "maquinas", :force => true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.string   "num_serie"
    t.text     "descripcion"
    t.integer  "tipo_area_tecnica"
    t.datetime "fecha_compra"
    t.datetime "fecha_termino_garantia"
    t.string   "foto_1"
    t.string   "foto_2"
    t.string   "video_1"
    t.string   "video_2"
    t.string   "codigo_interno"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordens", :force => true do |t|
    t.integer  "tipo_orden"
    t.integer  "numero_orden"
    t.datetime "fecha_apertura"
    t.datetime "fecha_cierre"
    t.text     "estado"
    t.text     "comentario_inicial"
    t.text     "comentario_final"
    t.text     "comentario_jefe"
    t.time     "hora_inicial"
    t.time     "hora_termino"
    t.datetime "fecha_visita"
    t.integer  "maquina_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peticions", :force => true do |t|
    t.text     "comentario"
    t.datetime "fecha_recepcion"
    t.integer  "maquina_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombres",           :limit => 150
    t.string   "apellidos",         :limit => 150
    t.string   "usuario",           :limit => 40,  :default => "", :null => false
    t.string   "password",          :limit => 40,  :default => "", :null => false
    t.integer  "capacidad_tecnica"
    t.integer  "tipo_usuario"
    t.string   "rut"
    t.string   "telefono_movil",    :limit => 50
    t.string   "telefono_oficina",  :limit => 50
    t.string   "telefono_fax",      :limit => 50
    t.string   "email",             :limit => 250
    t.string   "representante"
    t.string   "empresa"
    t.string   "direccion"
    t.string   "numero",            :limit => 10
    t.string   "ciudad"
    t.string   "comuna"
    t.string   "foto_path"
    t.text     "estado_tecnico"
    t.string   "authtoken"
    t.datetime "access"
    t.datetime "last_access"
    t.integer  "logins",                           :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
