class UsersController < ApplicationController
skip_after_action :verify_policy_scoped, only: [:index]
  def index
    if params[:search].present?
      @users = User.search_by_fullname(params[:search])
      @users = User.all if @users.empty?
    else
      @users = User.all
    end
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
