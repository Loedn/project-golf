class UsersController < ApplicationController
  def index
    @users = User.all?
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    @user = User.new
  end

  private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :gender, :admin, :photo, :photo_cache)
  end
end
