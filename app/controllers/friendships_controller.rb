class FriendshipsController < ApplicationController
  # GET /users/me/friends
  def index
    # If another user adds you as a friend, it will be returned in the GET /users/me/friends response
    friends = Friendship.friendships(@current_user)
    json_response({ friends: FriendshipSerializer.index(friends) }, ApiMessage::SUCCESS)
  end

  # POST /friendships
  def create
    friend = User.find_by(email: user_params[:email])
    return api_error('Friend not found', ApiMessage::ERROR_CODE_INVALID_PARAMETER) if friend.nil?

    friendship = Friendships::FriendshipService.create(@current_user, friend)
    json_response({ friendship: FriendshipSerializer.create(@current_user, friend) }, ApiMessage::CREATED) if friendship
  rescue ArgumentError, Friendships::InvalidRequestError => e
    api_error(e.message, ApiMessage::ERROR_CODE_UNPROCESSABLE_ENTITY)
  end

  private

  def user_params
    params.permit(:email)
  end
end
