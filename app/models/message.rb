class Message < ApplicationRecord
  belongs_to :medium
  validates :medium_id, presence: true
end
