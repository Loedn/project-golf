class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:update, :destroy]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:user_id])
    new_friend_request = current_user.pending_friend_requests.new(friend: friend)
    # binding.pry
    if new_friend_request.save
      Notification.create(user: friend, friend_request_id: new_friend_request.id)
      redirect_to :back
    end
      authorize new_friend_request
  end

  def update
    @friend_request.accept
    redirect_to :back
  end

  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
