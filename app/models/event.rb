class Event < ApplicationRecord
  belongs_to :user
  has_many :media
  has_many :messages, through: :media

  validates :title, :user_id, presence: true
end
