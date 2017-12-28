class Medium < ApplicationRecord
  belongs_to :event
  has_many :messages

  validates :url, :event_id, presence: true
end
