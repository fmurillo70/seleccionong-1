class CreateTipoEstadoCivils < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_estado_civils do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
