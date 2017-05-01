class Pregunta < ApplicationRecord
  belongs_to :pruebas_competencia
  has_many :opciones_respuestums, :dependent => :delete_all
end
