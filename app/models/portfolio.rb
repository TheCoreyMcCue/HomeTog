class Portfolio < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  def photo
    photos.first
  end
end
