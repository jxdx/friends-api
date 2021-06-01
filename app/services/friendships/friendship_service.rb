module Friendships
  class FriendshipService
    def self.create(user, friend)
      # Users can't befriend themselves
      raise Friendships::InvalidRequestError, "Sorry, you can't add yourself" if user.email == friend.email

      # You can only have them as a friend once!
      my_friend = Friendship.find_by(user_id: user.id, friend_id: friend.id)
      raise Friendships::InvalidRequestError, 'Sorry, you can only add a friend once.' if my_friend

      # They can't add you as a friend if you are already friends
      their_friend = Friendship.find_by(user_id: friend.id, friend_id: user.id)
      raise Friendships::InvalidRequestError, 'Sorry, you are already friends.' if their_friend

      # create friendship
      friendship = Friendship.new(user_id: user.id, friend_id: friend.id)
      raise Friendships::InvalidRequestError, 'We were unable to add this person as your friend.' unless friendship.save

      friendship
    end
  end
end
