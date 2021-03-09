class Portfolio < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  validates :photos, length: { minimum: 6 }

  def photo
    photos.first
  end

  def full_name
    user.full_name
  end

  def average_rating
    if reviews.length == 0
      return 0
    else
      sum = 0
      reviews.each do |review|
        sum += review.photographer_rating
      end
      (sum.to_f / reviews.length).round(2)
    end
  end


  def favorited?(current_user)
    Favorite.find_by(user_id: current_user.id, portfolio_id: id)
  end

  validates :user, uniqueness: true
end
