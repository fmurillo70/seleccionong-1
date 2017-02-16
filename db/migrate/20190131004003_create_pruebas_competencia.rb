class CreatePruebasCompetencia < ActiveRecord::Migration[5.0]
  def change
    create_table :pruebas_competencia do |t|
      t.string :nombre
      t.belongs_to :aptitudes, index: true, foreign_key: true
      t.timestamps
    end
  end
end
