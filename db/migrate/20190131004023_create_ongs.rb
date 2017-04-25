class CreateOngs < ActiveRecord::Migration[5.0]
  def change
    create_table :ongs do |t|
      t.references :user, foreign_key: true

      t.string  :nombre
      t.string  :nit
      t.string  :direccion
      t.string  :telefono
      t.string  :nombre_representante
      t.string  :apellido_representante
      t.string  :doc_representante
      t.string  :mision
      t.string  :vision
      t.date    :constitucion


      t.attachment :camaracomercio
      t.attachment :rut
      t.attachment :documentoidentidad


      t.timestamps
    end
  end
end
