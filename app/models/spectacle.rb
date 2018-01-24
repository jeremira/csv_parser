class Spectacle < ApplicationRecord
  has_many :venues

   validates :key, uniqueness: true
end
