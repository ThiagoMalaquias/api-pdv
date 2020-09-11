class AddTokenToAdministradors < ActiveRecord::Migration[6.0]
  def change
    add_column :administradors, :token, :string
  end
end
