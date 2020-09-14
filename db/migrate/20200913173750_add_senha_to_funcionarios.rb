class AddSenhaToFuncionarios < ActiveRecord::Migration[6.0]
  def change
    add_column :funcionarios, :senha, :string
  end
end
