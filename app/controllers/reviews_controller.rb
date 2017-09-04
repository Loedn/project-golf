class ReviewsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.course = @course
    @review.user = current_user
    authorize @course, :reviewable?
    if @review.save
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js
      end
        # redirect_to course_path(@course)
    else
      # respond_to do |format|
      #   format.html { render 'courses/show' }
      #   format.js  # <-- idem
      # end#
      respond_to do |format|
        format.html do
          if current_user
            @friends = User.where.not(id: current_user.id) # in the future this should be something like current_user.friends\
            end
          redirect_to course_path(@course)
        end
        format.js
      end
      @event = Event.new


      # render 'courses/show'
    end

  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
