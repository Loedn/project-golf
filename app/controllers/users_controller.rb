class UsersController < ApplicationController

  def index
    @users = User.all
    # User.reindex
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    if current_user
      @friends = User.where.not(id: current_user.id) # in the future this should be something like current_user.friends\
    end
  end

  def destroy
    @user = User.new
  end

  private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :gender, :admin, :photo, :photo_cache, :address)
  end
end
