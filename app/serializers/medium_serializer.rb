class MediumSerializer < ActiveModel::Serializer
  attributes :id, :message_sid, :ext, :media_type, :url, :event_id
  belongs_to :event
  has_many :messages

end
