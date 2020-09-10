class CreateTurno < ActiveRecord::Migration[6.0]
  def change
    create_table :turnos do |t|
      t.string :nome
    end
  end
end
