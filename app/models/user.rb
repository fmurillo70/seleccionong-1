class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :tipo_documento



  has_attached_file :certestudios
  has_attached_file :certexperiencia
  has_attached_file :docidentidad
  has_attached_file :tarjetaprofesional

  has_attached_file :camaracomercio
  has_attached_file :rut


  do_not_validate_attachment_file_type :certestudios
  do_not_validate_attachment_file_type :docidentidad
  do_not_validate_attachment_file_type :tarjetaprofesional
  do_not_validate_attachment_file_type :camaracomercio
  do_not_validate_attachment_file_type :rut
  do_not_validate_attachment_file_type :certexperiencia

  # has_one :tipo_de_sexos


end
