class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: [:index]


  def index
    @courses = policy_scope(Course)
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
  end

  def new
    @course = Course.new
    authorize @course
  end

  def update
    authorize @course
    @course = Course.find(params[:id])
    # binding.pry
    @course.update(course_edit_params)
    # @course.save
    # redirect_to course_dashboard_path(@course)
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
