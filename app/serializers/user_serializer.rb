class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :events
  has_many :media, through: :events
  has_many :messages, through: :media

end
