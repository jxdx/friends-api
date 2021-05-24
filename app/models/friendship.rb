class Friendship < ApplicationRecord
  # relationships
  belongs_to :user

  # validations
  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user_id, scope: :friend_id
end
