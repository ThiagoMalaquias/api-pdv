class CreateAdministradors < ActiveRecord::Migration[6.0]
  def change
    create_table :administradors do |t|
      t.string :nome
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
