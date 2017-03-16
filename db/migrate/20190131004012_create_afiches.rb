class CreateAfiches < ActiveRecord::Migration[5.0]
  def change
    create_table :afiches do |t|
      t.string :nombreorg
      t.string :nombrepuesto
      t.string :objetivospuesto
      t.string :horario
      t.string :actividadasociada
      t.string :beneficiarios
      t.string :quesehace
      t.string :comosehace
      t.string :coordinador
      t.string :requisitos
      t.string :experiencia
      t.string :incentivos
      t.string :periocidadincentivos

      t.timestamps
    end
  end
end
