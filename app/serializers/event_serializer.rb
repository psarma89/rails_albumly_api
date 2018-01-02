class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :twilio_number, :user_id
  belongs_to :user
  has_many :media
  has_many :messages, through: :media
end
