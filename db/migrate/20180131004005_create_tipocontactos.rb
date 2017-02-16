class CreateTipocontactos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipocontactos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
