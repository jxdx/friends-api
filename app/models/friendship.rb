class Friendship < ApplicationRecord
  # relationships
  belongs_to :user

  # validations
  validates_presence_of :user_id, :friend_id
  # Only one friend relationship can exist between two users
  validates_uniqueness_of :user_id, scope: :friend_id

  def self.friendships(user)
    Friendship.joins(:user).where('user_id = ? OR friend_id = ?', user.id, user.id)
              .order(created_at: :asc)
  end
end
