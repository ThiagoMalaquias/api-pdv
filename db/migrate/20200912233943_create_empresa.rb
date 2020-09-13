class CreateEmpresa < ActiveRecord::Migration[6.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj_cpf
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :estado
      t.string :telefone

      t.timestamps
    end
  end
end
