class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :medium_id
  belongs_to :medium
end
