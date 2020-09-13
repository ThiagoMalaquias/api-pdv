class CreateCategorias < ActiveRecord::Migration[6.0]
  def change
    create_table :categorias do |t|
      t.string :nome
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
