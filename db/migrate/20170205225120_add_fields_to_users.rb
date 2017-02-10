class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :tipodoc, :string
    add_column :users, :numdoc, :string
    add_column :users, :fechanacimiento, :date
    add_column :users, :edad, :int
    add_column :users, :sexo, :string
    add_column :users, :nacionalidad, :string
    add_column :users, :estadocivil, :string
    add_column :users, :direccion, :string
    add_column :users, :ubicacionvivienda, :string
    add_column :users, :tenenciavivienda, :string
    add_column :users, :numerocontacto, :string
    add_column :users, :tipocontacto, :string
    add_column :users, :religion, :string
    add_column :users, :nivelacademico, :string
    add_column :users, :ultimotitulo, :string
    add_column :users, :actualestudiante, :boolean
    add_column :users, :programaestudio, :boolean
    add_column :users, :tipoestudio, :boolean
    add_column :users, :jornadaestudio, :boolean



  end
end
