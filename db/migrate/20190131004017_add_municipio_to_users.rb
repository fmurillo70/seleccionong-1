class AddMunicipioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :municipio,    foreign_key: true
    add_reference :users, :departamento, foreign_key: true
  end
end
