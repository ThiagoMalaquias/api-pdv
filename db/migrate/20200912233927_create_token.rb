class CreateToken < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :nome

      t.timestamps
    end
  end
end
