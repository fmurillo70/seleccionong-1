class Voluntario < ApplicationRecord
  belongs_to :user




  has_attached_file :certestudios
  has_attached_file :certexperiencia
  has_attached_file :docidentidad
  has_attached_file :tarjetaprofesional

  do_not_validate_attachment_file_type :certestudios
  do_not_validate_attachment_file_type :certexperiencia
  do_not_validate_attachment_file_type :docidentidad
  do_not_validate_attachment_file_type :tarjetaprofesional
end
