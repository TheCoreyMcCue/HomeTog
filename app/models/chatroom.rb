class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :portfolio
  belongs_to :user
  # validates :name, presence: true
  validates :portfolio, uniqueness: { scope: :user}
end
