class CreateFuncionarios < ActiveRecord::Migration[6.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :endereco
      t.string :turno
      t.date :data_contratacao
      t.string :sexo

      t.timestamps
    end
  end
end
