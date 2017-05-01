class PruebasCompetencia < ApplicationRecord
  has_many :preguntas, :dependent => :delete_all
end
