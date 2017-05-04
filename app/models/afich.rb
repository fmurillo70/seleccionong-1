class Afich < ApplicationRecord
  has_many :aficherequisitos
  has_many :aplicacionafiche
  belongs_to :user
end
