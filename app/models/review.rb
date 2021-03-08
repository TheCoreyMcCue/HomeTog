class Review < ApplicationRecord
  belongs_to :reservation
  validates :reservation, uniqueness: true
end
