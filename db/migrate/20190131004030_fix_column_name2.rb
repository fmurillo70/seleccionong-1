class FixColumnName2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :respuesta, :resultados_id, :resultado_id
  end
end
