class EventSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
  has_many :media
  has_many :messages, through: :media
end
