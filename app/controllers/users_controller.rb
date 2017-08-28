class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def destroy
  end

  def create
  end
  def user_params
  params.require(:user).permit(:photo, :photo_cache)
end
end
