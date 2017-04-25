class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :nombre
      t.references :municipio, foreign_key: true

      t.timestamps
    end
  end
end
