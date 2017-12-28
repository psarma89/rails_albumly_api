class User < ApplicationRecord
  has_many :events
  has_many :media, through: :events
  has_many :messages, through: :media

  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
end
