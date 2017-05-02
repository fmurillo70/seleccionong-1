class AddFieldsadminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombreadmin, :string
    add_column :users, :apellidoadmin, :string
    add_column :users, :cedulaadmin, :string
    add_column :users, :cargoadmin, :string
  end
end
