class Favorite < ApplicationRecord
  # validates :users, uniqueness: {scope: :portfolios}

  belongs_to :user
  belongs_to :portfolio
end
