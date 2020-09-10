class AddTurnoAndAdministradorToFuncionarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :funcionarios, :administradors, null: false, foreign_key: true
  end
end
