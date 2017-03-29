class CreateAficherequisitos < ActiveRecord::Migration[5.0]
  def change
    create_table :aficherequisitos do |t|
      t.references :aptitude, foreign_key: true
      t.references :afich, foreign_key: true
      t.integer :valor

      t.timestamps
    end
  end
end
