class AddEmpresaToClientes < ActiveRecord::Migration[6.0]
  def change
    add_reference :clientes, :empresa, null: false, foreign_key: true
  end
end
