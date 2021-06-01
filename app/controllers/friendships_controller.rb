class FriendshipsController < ApplicationController
  # GET /users/me/friends
  def index
    friends = @current_user.friendships.includes(:user)
    json_response({friends: FriendshipSerializer.index(friends)})
  end

  # POST /friendships
  def create
    friend = User.find_by(email: user_params[:email])
    if friend
      Friendship.find_or_create_by(user_id: @current_user.id, friend_id: friend.id)
      json_response({friendship: FriendshipSerializer.create(@current_user, friend)}, :created)
    else
      api_error('Friend not found')
    end
  end

  private

  def user_params
    params.permit(:email)
  end
end
