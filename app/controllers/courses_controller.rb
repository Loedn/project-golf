class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  after_action :verify_policy_scoped, only: [:dashboard]
  skip_after_action :verify_authorized, only: [:dashboard]

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
    @event = Event.new
    @friends = User.where.not(id: current_user.id) # in the future this should be something like current_user.friends
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    @course.update(courses_params)
    redirect_to course_dashboard_path(@course)
    authorize @course
  end

  def dashboard
    @courses = policy_scope(Course).where(owner: current_user)
  end


  def new
    @course = Course.new
    authorize @course
  end

  def update
    authorize @course
    @course = Course.find(params[:id])
    @course.update(course_edit_params)
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
    authorize @course
  end

  private

  def course_params
  params.require(:course).permit(:name, :address, :description, :image, :image_cache)
  end

  def course_edit_params
    params.require(:course).permit(:name, :address, :description, :image, :image_cache, :email, :phone, :timeslots, :badges)
  end
end
