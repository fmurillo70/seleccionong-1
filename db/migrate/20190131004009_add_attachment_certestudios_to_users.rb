class AddAttachmentCertestudiosToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :certestudios
      t.attachment :certexperiencia
      t.attachment :docidentidad
      t.attachment :tarjetaprofesional

      t.attachment :camaracomercio
      t.attachment :rut

      t.string :mision
      t.string :vision
      t.string :nombresrepresentante
      t.string :apellidosrepresentante
      t.string :numdocrepresentante

    end
  end

  def self.down
    remove_attachment :users, :certestudios
  end
end
