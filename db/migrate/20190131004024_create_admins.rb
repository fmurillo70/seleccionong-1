class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.references :user, foreign_key: true
      t.string :nombres
      t.string :apellidos


      t.timestamps
    end
  end
end
