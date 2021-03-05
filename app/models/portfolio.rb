class Portfolio < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def photo
    photos.first
  end



  def favorited?(current_user)
    Favorite.find_by(user_id: current_user.id, portfolio_id: id)
  end

  validates :user, uniqueness: true
end
