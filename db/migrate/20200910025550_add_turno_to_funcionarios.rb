class AddTurnoToFuncionarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :funcionarios, :turno, null: false, foreign_key: true
  end
end
