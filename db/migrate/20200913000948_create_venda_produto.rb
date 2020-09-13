class CreateVendaProduto < ActiveRecord::Migration[6.0]
  def change
    create_table :venda_produtos do |t|
      t.references :venda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
