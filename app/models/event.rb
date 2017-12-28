class Event < ApplicationRecord
  belongs_to :user
  has_many :media, dependent: :destroy
  has_many :messages, through: :media, dependent: :destroy

  validates :title, :user_id, presence: true

end
