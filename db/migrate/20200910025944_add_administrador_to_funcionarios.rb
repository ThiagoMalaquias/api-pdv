class AddAdministradorToFuncionarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :funcionarios, :administrador, null: false, foreign_key: true
  end
end
