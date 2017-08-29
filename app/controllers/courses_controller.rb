class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def update
    authorize @course
    @course = Course.find(params[:id])
    # binding.pry
    @course.update(courses_params)
    # @course.save
    # redirect_to course_dashboard_path(@course)
  end

  def destroy
    authorize @course
    @course = Course.destroy(params[:id])
    # we should add a redirect_to here
  end

  def create
    authorize @course
  end

  private

  def course_params
  params.require(:course).permit(:name, :address, :description, :photo, :photo_cache, :email, :phone, :timeslots, :badges)
  end
end
