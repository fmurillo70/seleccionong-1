class AddEpsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :actualmentetrabaja, :string
    add_column :users, :tipo_eps, :string
    add_column :users, :estrato, :string
    add_column :users, :nombrepersona, :string
    add_column :users, :telpersona, :string
    add_column :users, :relacionpersona, :string
  end
end
