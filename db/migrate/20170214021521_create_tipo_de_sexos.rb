class CreateTipoDeSexos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_de_sexos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
