class CreatePaises < ActiveRecord::Migration[5.0]
  def change
    create_table :paises do |t|
      t.string :nombre
      t.string :bandera

      t.timestamps
    end
  end
end
