class FriendshipsController < ApplicationController
  def index

  end
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: FriendRequest.find(params[:friend_request_id]).user.id)
    if @friendship.save
      @notification = Notification.where(friend_request_id: params[:friend_request_id])
      @notification.update(read: true)
    end
    authorize @friendship
    redirect_to :back
  end
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to root_path
  end
end
