class CreateDetalleubicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :detalleubicacions do |t|
      t.string :nombre
      t.belongs_to :ubicacionvivienda, foreign_key: true

      t.timestamps
    end
  end
end
