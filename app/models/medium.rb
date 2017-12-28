class Medium < ApplicationRecord
  belongs_to :event
  has_many :messages, dependent: :destroy

  validates :message_sid, :url, :event_id, presence: true
  validates :message_sid, uniqueness: true
end
