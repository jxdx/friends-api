class FriendshipSerializer
  def self.index(friends)
    friends.map do |friend|
      {
        'name': friend.name,
        'email': friend.email
      }
    end
  end

  def self.create(user, friend)
    {
      'user':
        {
          'name': user.name,
          'email': user.email
        },
      'friend':
        {
          'name': friend.name,
          'email': friend.email
        }
    }
  end
end
