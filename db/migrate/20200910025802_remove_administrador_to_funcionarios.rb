class RemoveAdministradorToFuncionarios < ActiveRecord::Migration[6.0]
  def change
    remove_column :funcionarios, :administradors_id
  end
end
