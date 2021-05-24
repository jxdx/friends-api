class UserSerializer
  def self.index(users)
    users.map do |user|
      {
        name: user.name,
        email: user.email
      }
    end
  end
end
