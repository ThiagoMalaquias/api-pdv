class CreateFuncionario < ActiveRecord::Migration[6.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :email
      t.string :cpf
      t.string :admin
      t.string :token
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
