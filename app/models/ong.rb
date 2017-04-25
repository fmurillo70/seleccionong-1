class Ong < ApplicationRecord
  belongs_to :user

  has_attached_file :camaracomercio
  has_attached_file :documentoidentidad
  has_attached_file :rut

  do_not_validate_attachment_file_type :camaracomercio
  do_not_validate_attachment_file_type :documentoidentidad
  do_not_validate_attachment_file_type :rut
end
