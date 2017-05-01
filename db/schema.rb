# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190131004026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nombres"
    t.string   "apellidos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "aficherequisitos", force: :cascade do |t|
    t.integer  "aptitude_id"
    t.integer  "afich_id"
    t.integer  "valor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["afich_id"], name: "index_aficherequisitos_on_afich_id", using: :btree
    t.index ["aptitude_id"], name: "index_aficherequisitos_on_aptitude_id", using: :btree
  end

  create_table "afiches", force: :cascade do |t|
    t.string   "nombreorg"
    t.string   "nombrepuesto"
    t.string   "objetivospuesto"
    t.string   "horario"
    t.string   "actividadasociada"
    t.string   "beneficiarios"
    t.string   "quesehace"
    t.string   "comosehace"
    t.string   "coordinador"
    t.string   "requisitos"
    t.string   "experiencia"
    t.string   "incentivos"
    t.string   "periocidadincentivos"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_afiches_on_user_id", using: :btree
  end

  create_table "aplicacionafiches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "afich_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["afich_id"], name: "index_aplicacionafiches_on_afich_id", using: :btree
    t.index ["user_id"], name: "index_aplicacionafiches_on_user_id", using: :btree
  end

  create_table "aptitudes", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalleubicacions", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "ubicacionvivienda_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["ubicacionvivienda_id"], name: "index_detalleubicacions_on_ubicacionvivienda_id", using: :btree
  end

  create_table "jornadaestudios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipios", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["departamento_id"], name: "index_municipios_on_departamento_id", using: :btree
  end

  create_table "nivelacademicos", force: :cascade do |t|
    t.boolean  "actualmenteestudia"
    t.string   "programaestudio"
    t.string   "ultimotitulo"
    t.integer  "tipoestudio_id"
    t.integer  "jornadaestudio_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["jornadaestudio_id"], name: "index_nivelacademicos_on_jornadaestudio_id", using: :btree
    t.index ["tipoestudio_id"], name: "index_nivelacademicos_on_tipoestudio_id", using: :btree
  end

  create_table "ongs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "nit"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "nombre_representante"
    t.string   "apellido_representante"
    t.string   "doc_representante"
    t.string   "mision"
    t.string   "vision"
    t.date     "constitucion"
    t.string   "camaracomercio_file_name"
    t.string   "camaracomercio_content_type"
    t.integer  "camaracomercio_file_size"
    t.datetime "camaracomercio_updated_at"
    t.string   "rut_file_name"
    t.string   "rut_content_type"
    t.integer  "rut_file_size"
    t.datetime "rut_updated_at"
    t.string   "documentoidentidad_file_name"
    t.string   "documentoidentidad_content_type"
    t.integer  "documentoidentidad_file_size"
    t.datetime "documentoidentidad_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_ongs_on_user_id", using: :btree
  end

  create_table "opciones_respuesta", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "valor"
    t.integer  "pregunta_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pregunta_id"], name: "index_opciones_respuesta_on_pregunta_id", using: :btree
  end

  create_table "paises", force: :cascade do |t|
    t.string   "nombre"
    t.string   "bandera"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pregunta", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "pruebas_competencia_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["pruebas_competencia_id"], name: "index_pregunta_on_pruebas_competencia_id", using: :btree
  end

  create_table "pruebas_competencia", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "aptitudes_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["aptitudes_id"], name: "index_pruebas_competencia_on_aptitudes_id", using: :btree
  end

  create_table "religions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "respuesta", force: :cascade do |t|
    t.string   "texto"
    t.integer  "puntaje"
    t.integer  "resultados_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resultados_id"], name: "index_respuesta_on_resultados_id", using: :btree
  end

  create_table "resultados", force: :cascade do |t|
    t.integer  "pruebas_competencia_id"
    t.integer  "users_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["pruebas_competencia_id"], name: "index_resultados_on_pruebas_competencia_id", using: :btree
    t.index ["users_id"], name: "index_resultados_on_users_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "municipio_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["municipio_id"], name: "index_sectors_on_municipio_id", using: :btree
  end

  create_table "tenenciaviviendas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_de_sexos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_documentos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_estado_civils", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipocontactos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipoestudios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipousers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubicacionviviendas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "esvoluntario"
    t.boolean  "esong"
    t.boolean  "esadmin"
    t.boolean  "aprobado"
    t.integer  "tipouser_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "municipio_id"
    t.string   "observacion"
    t.string   "actualmentetrabaja"
    t.string   "tipo_eps"
    t.string   "estrato"
    t.string   "nombrepersona"
    t.string   "telpersona"
    t.string   "relacionpersona"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["municipio_id"], name: "index_users_on_municipio_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["tipouser_id"], name: "index_users_on_tipouser_id", using: :btree
  end

  create_table "voluntario_pruebas", force: :cascade do |t|
    t.integer  "pruebas_competencia_id"
    t.integer  "users_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["pruebas_competencia_id"], name: "index_voluntario_pruebas_on_pruebas_competencia_id", using: :btree
    t.index ["users_id"], name: "index_voluntario_pruebas_on_users_id", using: :btree
  end

  create_table "voluntarios", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "numdoc"
    t.date     "fechanacimiento"
    t.integer  "edad"
    t.string   "direccion"
    t.string   "numerocontacto"
    t.integer  "paises_id"
    t.integer  "tipo_de_sexos_id"
    t.integer  "tipo_estado_civils_id"
    t.integer  "tipo_documentos_id"
    t.integer  "religions_id"
    t.integer  "ubicacionviviendas_id"
    t.integer  "tenenciaviviendas_id"
    t.integer  "tipocontactos_id"
    t.integer  "nivelacademicos_id"
    t.integer  "municipio_id"
    t.integer  "departamento_id"
    t.integer  "sector_id"
    t.integer  "zone_id"
    t.string   "certestudios_file_name"
    t.string   "certestudios_content_type"
    t.integer  "certestudios_file_size"
    t.datetime "certestudios_updated_at"
    t.string   "certexperiencia_file_name"
    t.string   "certexperiencia_content_type"
    t.integer  "certexperiencia_file_size"
    t.datetime "certexperiencia_updated_at"
    t.string   "docidentidad_file_name"
    t.string   "docidentidad_content_type"
    t.integer  "docidentidad_file_size"
    t.datetime "docidentidad_updated_at"
    t.string   "tarjetaprofesional_file_name"
    t.string   "tarjetaprofesional_content_type"
    t.integer  "tarjetaprofesional_file_size"
    t.datetime "tarjetaprofesional_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["departamento_id"], name: "index_voluntarios_on_departamento_id", using: :btree
    t.index ["municipio_id"], name: "index_voluntarios_on_municipio_id", using: :btree
    t.index ["nivelacademicos_id"], name: "index_voluntarios_on_nivelacademicos_id", using: :btree
    t.index ["paises_id"], name: "index_voluntarios_on_paises_id", using: :btree
    t.index ["religions_id"], name: "index_voluntarios_on_religions_id", using: :btree
    t.index ["sector_id"], name: "index_voluntarios_on_sector_id", using: :btree
    t.index ["tenenciaviviendas_id"], name: "index_voluntarios_on_tenenciaviviendas_id", using: :btree
    t.index ["tipo_de_sexos_id"], name: "index_voluntarios_on_tipo_de_sexos_id", using: :btree
    t.index ["tipo_documentos_id"], name: "index_voluntarios_on_tipo_documentos_id", using: :btree
    t.index ["tipo_estado_civils_id"], name: "index_voluntarios_on_tipo_estado_civils_id", using: :btree
    t.index ["tipocontactos_id"], name: "index_voluntarios_on_tipocontactos_id", using: :btree
    t.index ["ubicacionviviendas_id"], name: "index_voluntarios_on_ubicacionviviendas_id", using: :btree
    t.index ["user_id"], name: "index_voluntarios_on_user_id", using: :btree
    t.index ["zone_id"], name: "index_voluntarios_on_zone_id", using: :btree
  end

  create_table "zones", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_zones_on_sector_id", using: :btree
  end

  add_foreign_key "admins", "users"
  add_foreign_key "aficherequisitos", "afiches"
  add_foreign_key "aficherequisitos", "aptitudes"
  add_foreign_key "afiches", "users"
  add_foreign_key "aplicacionafiches", "afiches"
  add_foreign_key "aplicacionafiches", "users"
  add_foreign_key "detalleubicacions", "ubicacionviviendas"
  add_foreign_key "municipios", "departamentos"
  add_foreign_key "nivelacademicos", "jornadaestudios"
  add_foreign_key "nivelacademicos", "tipoestudios"
  add_foreign_key "ongs", "users"
  add_foreign_key "opciones_respuesta", "pregunta", column: "pregunta_id"
  add_foreign_key "pregunta", "pruebas_competencia", column: "pruebas_competencia_id"
  add_foreign_key "pruebas_competencia", "aptitudes", column: "aptitudes_id"
  add_foreign_key "respuesta", "resultados", column: "resultados_id"
  add_foreign_key "resultados", "pruebas_competencia", column: "pruebas_competencia_id"
  add_foreign_key "resultados", "users", column: "users_id"
  add_foreign_key "sectors", "municipios"
  add_foreign_key "users", "municipios"
  add_foreign_key "users", "tipousers"
  add_foreign_key "voluntario_pruebas", "pruebas_competencia", column: "pruebas_competencia_id"
  add_foreign_key "voluntario_pruebas", "users", column: "users_id"
  add_foreign_key "voluntarios", "departamentos"
  add_foreign_key "voluntarios", "municipios"
  add_foreign_key "voluntarios", "nivelacademicos", column: "nivelacademicos_id"
  add_foreign_key "voluntarios", "paises", column: "paises_id"
  add_foreign_key "voluntarios", "religions", column: "religions_id"
  add_foreign_key "voluntarios", "sectors"
  add_foreign_key "voluntarios", "tenenciaviviendas", column: "tenenciaviviendas_id"
  add_foreign_key "voluntarios", "tipo_de_sexos", column: "tipo_de_sexos_id"
  add_foreign_key "voluntarios", "tipo_documentos", column: "tipo_documentos_id"
  add_foreign_key "voluntarios", "tipo_estado_civils", column: "tipo_estado_civils_id"
  add_foreign_key "voluntarios", "tipocontactos", column: "tipocontactos_id"
  add_foreign_key "voluntarios", "ubicacionviviendas", column: "ubicacionviviendas_id"
  add_foreign_key "voluntarios", "users"
  add_foreign_key "voluntarios", "zones"
  add_foreign_key "zones", "sectors"
end
