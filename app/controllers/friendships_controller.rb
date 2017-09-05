class FriendshipsController < ApplicationController
  def index

  end
  def create
    @friendship = Friendship.create(user_id: current_user.id, friend_id: FriendRequest.find(params[:friend_request_id]).user.id)
    redirect_to :back
    authorize @friendship
  end
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to root_path
  end
end
