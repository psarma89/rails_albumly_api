class Event < ApplicationRecord
  belongs_to :user
  has_many :media, dependent: :destroy
  has_many :messages, through: :media, dependent: :destroy

  validates :title, :user_id, presence: true

  # Create a single linked medium record taking in the twilio params hash and pulling necessary values
  def create_medium(params)
    self.media.create(message_sid: params["MessageSid"], ext: params["MediaContentType0"].split("/")[1], media_type: params["MediaContentType0"].split("/")[0], url: params["MediaUrl0"])
  end
end
