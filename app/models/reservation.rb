class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
  has_one :review

  validates :date, presence: true
end
