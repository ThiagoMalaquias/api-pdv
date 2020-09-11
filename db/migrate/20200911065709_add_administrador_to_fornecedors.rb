class AddAdministradorToFornecedors < ActiveRecord::Migration[6.0]
  def change
    add_reference :fornecedors, :administrador, null: false, foreign_key: true
  end
end
