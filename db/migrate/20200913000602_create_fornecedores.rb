class CreateFornecedores < ActiveRecord::Migration[6.0]
  def change
    create_table :fornecedores do |t|
      t.string :cnpj
      t.string :nome
      t.string :telefone
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
