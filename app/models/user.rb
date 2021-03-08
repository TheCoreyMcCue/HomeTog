class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :portfolio
  has_many :reservations
  has_many :favorites
  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end
end
