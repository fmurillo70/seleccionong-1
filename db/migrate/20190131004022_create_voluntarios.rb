class CreateVoluntarios < ActiveRecord::Migration[5.0]
  def change
    create_table :voluntarios do |t|
      t.references :user, foreign_key: true

      t.string  :nombres
      t.string  :apellidos
      t.string  :numdoc
      t.date    :fechanacimiento
      t.integer :edad
      t.string  :direccion
      t.string  :numerocontacto

      t.boolean :actualmentetrabaja


      t.string :tipo_eps
      t.string :estrato
      t.string :nombrepersona
      t.string :telpersona
      t.string :relacionpersona


      t.belongs_to :paises, index: true, foreign_key: true
      t.belongs_to :tipo_de_sexos, index: true, foreign_key: true
      t.belongs_to :tipo_estado_civils, index: true, foreign_key: true
      t.belongs_to :tipo_documentos, index: true, foreign_key: true
      t.belongs_to :religions, index: true, foreign_key: true
      t.belongs_to :ubicacionviviendas, index: true, foreign_key: true
      t.belongs_to :tenenciaviviendas, index: true, foreign_key: true
      t.belongs_to :tipocontactos, index: true, foreign_key: true
      t.belongs_to :nivelacademicos, index: true, foreign_key: true


      t.references :municipio , foreign_key: true
      t.references :departamento , foreign_key: true
      t.references :sector , foreign_key: true
      t.references :zone , foreign_key: true

      t.attachment :certestudios
      t.attachment :certexperiencia
      t.attachment :docidentidad
      t.attachment :tarjetaprofesional



      t.timestamps
    end
  end
end
