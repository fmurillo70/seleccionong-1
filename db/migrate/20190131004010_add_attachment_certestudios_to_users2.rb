class AddAttachmentCertestudiosToUsers2 < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.boolean :esvoluntario
      t.boolean :esong
      t.boolean :esadmin
      t.boolean :aprobado
    end
  end

  def self.down
    remove_attachment :users, :certestudios
  end
end
