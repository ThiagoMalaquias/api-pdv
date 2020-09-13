class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.integer :qtd_estoque
      t.references :categorias, null: false, foreign_key: true
      t.references :fornecedores, null: false, foreign_key: true
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
