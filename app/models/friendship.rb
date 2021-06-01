class Friendship < ApplicationRecord
  # relationships
  belongs_to :user

  # validations
  validates_presence_of :user_id, :friend_id
  # Only one friend relationship can exist between two users
  validates_uniqueness_of :user_id, scope: :friend_id

  def self.friendships(user)
    my_friends = Friendship.where(user_id: user.id).pluck(:friend_id)
    i_am_friended = Friendship.where(friend_id: user.id).pluck(:user_id)
    ids = my_friends + i_am_friended
    User.where(id: ids)
  end
end
