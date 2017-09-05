class FriendshipsController < ApplicationController
  def index

  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to root_path
  end
end
