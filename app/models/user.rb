class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :portfolio, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  def full_name
    if first_name && last_name
      "#{first_name.capitalize} #{last_name.capitalize}"
    end
  end
end
