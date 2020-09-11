# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_11_065709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.string "endereco"
    t.string "sexo"
    t.bigint "administrador_id", null: false
    t.index ["administrador_id"], name: "index_fornecedors_on_administrador_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.string "endereco"
    t.date "data_contratacao"
    t.string "sexo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "turno_id", null: false
    t.bigint "administrador_id", null: false
    t.index ["administrador_id"], name: "index_funcionarios_on_administrador_id"
    t.index ["turno_id"], name: "index_funcionarios_on_turno_id"
  end

  create_table "turnos", force: :cascade do |t|
    t.string "nome"
  end

  add_foreign_key "fornecedors", "administradors"
  add_foreign_key "funcionarios", "administradors"
  add_foreign_key "funcionarios", "turnos"
end
