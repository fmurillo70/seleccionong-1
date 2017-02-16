class CreateOpcionesRespuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :opciones_respuesta do |t|
      t.string :nombre
      t.integer :valor
      t.belongs_to :pregunta, index: true, foreign_key: true
      t.timestamps
    end
  end
end
