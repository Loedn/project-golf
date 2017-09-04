class UsersController < ApplicationController

  def index
    @users = User.all
    # User.reindex
  end

  def dashboard
    @user = User.find(params[:user_id])
    authorize @user
    @events = @user.events

    if current_user
      @friends = User.where.not(id: @user.id).limit(10) # in the future this should be something like current_user.friends\
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @events = @user.events

    if current_user
      @friends = User.where.not(id: @user.id).limit(10) # in the future this should be something like current_user.friends\
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)

  end

  def destroy
    @user = User.new
  end

  private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :gender, :admin, :photo, :photo_cache, :address, :description, :favourite_course)
  end
end
