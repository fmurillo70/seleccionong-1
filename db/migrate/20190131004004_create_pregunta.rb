class CreatePregunta < ActiveRecord::Migration[5.0]
  def change
    create_table :pregunta do |t|
      t.string :nombre
      t.belongs_to :pruebas_competencia, index: true, foreign_key: true
      t.timestamps
    end
  end
end
