class CreateVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :vendas do |t|
      t.decimal :valor_total
      t.references :cliente, null: false, foreign_key: true
      t.references :funcionario, null: false, foreign_key: true
      t.references :pagamento, null: false, foreign_key: true
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
