class CreateResultados < ActiveRecord::Migration[5.0]
  def change
    create_table :resultados do |t|
      t.belongs_to :pruebas_competencia, index: true, foreign_key: true
      t.belongs_to :users, index: true, foreign_key: true
      t.timestamps
    end
  end
end
