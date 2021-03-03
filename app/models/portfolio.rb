class Portfolio < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_one :favorites
  has_many :reservations

  def favorited?(current_user)
    Favorite.find_by(user_id: current_user.id, portfolio_id: self.id)
  end
end
