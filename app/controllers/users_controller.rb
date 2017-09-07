class UsersController < ApplicationController
skip_after_action :verify_policy_scoped, only: [:index]
  def index
    if params[:search].present?
      @users = User.search_by_fullname(params[:search])
      @users = User.all.where.not(id: current_user.id) if @users.empty?
    else
      @users = User.all.where.not(id: current_user.id)
    end
  end

  def dashboard
    @user = User.find(params[:user_id])
    authorize @user
    @events = @user.events

    if current_user
      @friends = @user.friends
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @events = @user.events

    if current_user
      @friends = @user.friends
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
