class Medium < ApplicationRecord
  belongs_to :event
  has_many :messages, dependent: :destroy

  validates :message_sid, :url, :event_id, presence: true
  validates :message_sid, uniqueness: true

  # Create a single linked message record taking in the twilio params hash and pulling necessary values
  def create_message(params)
    self.messages.create(body: params["Body"])
  end
end
