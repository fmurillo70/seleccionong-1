class CreateTipoestudios < ActiveRecord::Migration[5.0]
  def change
    create_table :tipoestudios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
