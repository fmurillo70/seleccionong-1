class CreateRespuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :respuesta do |t|
      t.string :texto
      t.integer :puntaje
      t.belongs_to :resultados, index: true, foreign_key: true
      t.timestamps
    end
  end
end
