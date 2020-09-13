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

ActiveRecord::Schema.define(version: 2020_09_13_024717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_categorias_on_empresa_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "empresa_id", null: false
    t.index ["empresa_id"], name: "index_clientes_on_empresa_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj_cpf"
    t.string "endereco"
    t.string "bairro"
    t.string "cep"
    t.string "estado"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fornecedores", force: :cascade do |t|
    t.string "cnpj"
    t.string "nome"
    t.string "telefone"
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_fornecedores_on_empresa_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.string "admin"
    t.string "token"
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_funcionarios_on_empresa_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.string "forma_pagamento"
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_pagamentos_on_empresa_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco"
    t.integer "qtd_estoque"
    t.bigint "categorias_id", null: false
    t.bigint "fornecedores_id", null: false
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorias_id"], name: "index_produtos_on_categorias_id"
    t.index ["empresa_id"], name: "index_produtos_on_empresa_id"
    t.index ["fornecedores_id"], name: "index_produtos_on_fornecedores_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venda_produtos", force: :cascade do |t|
    t.bigint "venda_id", null: false
    t.bigint "produto_id", null: false
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_venda_produtos_on_empresa_id"
    t.index ["produto_id"], name: "index_venda_produtos_on_produto_id"
    t.index ["venda_id"], name: "index_venda_produtos_on_venda_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.decimal "valor_total"
    t.bigint "cliente_id", null: false
    t.bigint "funcionario_id", null: false
    t.bigint "pagamento_id", null: false
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
    t.index ["empresa_id"], name: "index_vendas_on_empresa_id"
    t.index ["funcionario_id"], name: "index_vendas_on_funcionario_id"
    t.index ["pagamento_id"], name: "index_vendas_on_pagamento_id"
  end

  add_foreign_key "categorias", "empresas"
  add_foreign_key "clientes", "empresas"
  add_foreign_key "fornecedores", "empresas"
  add_foreign_key "funcionarios", "empresas"
  add_foreign_key "pagamentos", "empresas"
  add_foreign_key "produtos", "categorias", column: "categorias_id"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "fornecedores", column: "fornecedores_id"
  add_foreign_key "venda_produtos", "empresas"
  add_foreign_key "venda_produtos", "produtos"
  add_foreign_key "venda_produtos", "vendas"
  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "empresas"
  add_foreign_key "vendas", "funcionarios"
  add_foreign_key "vendas", "pagamentos"
end
