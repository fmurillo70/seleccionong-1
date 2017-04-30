class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :tipo_documento
  has_one :municipio
  has_one :ong
  has_one :voluntario


  def self.search(email)
    if email
      where('email = ?',email).first
    end

  end











  #validates :nombres, :presence => true
  #validates :apellidos, :presence => true
  #validates :numdoc, :presence => true
  #validates :tipo_de_sexos_id, :presence => true
  #validates :paises_id, :presence => true
  #validates :tipo_estado_civils_id, :presence => true
  #validates :ubicacionviviendas_id, :presence => true
  #validates :tenenciaviviendas_id, :presence => true
  #validates :nivelacademicos_id, :presence => true







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
