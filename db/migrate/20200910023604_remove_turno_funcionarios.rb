class RemoveTurnoFuncionarios < ActiveRecord::Migration[6.0]
  def change
    remove_column :funcionarios, :turno
  end
end
