class CreateNivelacademicos < ActiveRecord::Migration[5.0]
  def change
    create_table :nivelacademicos do |t|
      t.boolean :actualmenteestudia
      t.string :programaestudio
      t.string :ultimotitulo
      t.belongs_to :tipoestudio, foreign_key: true
      t.belongs_to :jornadaestudio, foreign_key: true

      t.timestamps
    end
  end
end
