class CreateFornecedor < ActiveRecord::Migration[6.0]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :endereco
      t.string :sexo
    end
  end
end
