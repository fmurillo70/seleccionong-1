class CreateJornadaestudios < ActiveRecord::Migration[5.0]
  def change
    create_table :jornadaestudios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
