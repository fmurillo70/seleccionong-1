class Resultado < ApplicationRecord
  belongs_to :user
  has_many :respuestas
  belongs_to :pruebas_competencia
end
