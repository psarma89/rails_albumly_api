class User < ApplicationRecord
  has_many :events
  has_many :media, through: :events
  has_many :messages, through: :media

  validates :email, presence: true
end
