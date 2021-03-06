class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :dashboard]
  # after_action :verify_policy_scoped, only: [:dashboard]
  # skip_after_action :verify_authorized, only: [:dashboard]

  def index
    @courses = policy_scope(Course)
    @address = params[:address]

    if @address.nil? || @address == ''
      @courses = Course.all
    else
      @courses = Course.near(params[:address], 100).where.not(latitude: nil, longitude: nil)
    end
  end

  def show
    @course = Course.find(params[:id])
    @review = Review.new
    authorize @course
    @event = Event.new
    if current_user
      @friends = current_user.friends.limit(3)
    end
    authorize @course

  end

  def dashboard
    # @course = policy_scope(Course).where(owner: current_user).first
    @course = Course.find(params[:course_id])
    authorize @course
    redirect_to root_path if @course.nil?
    @user = @course.owner
    @events = @user.events
    if current_user
      @friends = User.where.not(id: @user.id).limit(10) # in the future this should be something like current_user.friends\
    end

  end

  def new
    @course = Course.new
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    authorize @course

    @course.update(course_edit_params)

    @course.sand = params[:course][:sand] == 1
    @course.water = params[:course][:water] == 1
    @course.trees = params[:course][:trees] == 1
    @course.plain = params[:course][:plain] == 1
    #build the array of date based on params[:course][:disabled_days]
    updated_days = []
    if params[:course][:disabled_days]
      params[:course][:disabled_days].each do |d|
        updated_days << d
        @course.update(disabled_days: updated_days.slice(1, updated_days.size))
      end
    end

    redirect_to @course
  end

  def destroy
    authorize @course
    @course = Course.destroy(params[:id])
    # we should add a redirect_to here
  end

  def create
    @course = Course.new(course_params)
    @course.owner = current_user
    @course.save
    redirect_to course_path(@course)
    18.times do |i|
      hole = Hole.new(name: '#{i+1}', par: 3)
      hole.course = @course
      hole.save!
    end
    authorize @course
  end

  private

  def course_params
  params.require(:course).permit(:name, :address, :description, :image, :image_cache, :price)
  end

  def course_edit_params
    params.require(:course).permit(:name, :address, :description, :image, :image_cache, :email, :phone, :timeslots, :badges, :price, :size, :water, :sand, :trees, :plain)
  end
end
