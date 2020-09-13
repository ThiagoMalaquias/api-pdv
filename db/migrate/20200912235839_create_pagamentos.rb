class CreatePagamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :pagamentos do |t|
      t.string :forma_pagamento
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
