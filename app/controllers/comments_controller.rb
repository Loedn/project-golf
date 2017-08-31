class CommentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.event = @event
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js
      end
      # redirect_to event_path(@event) # make ajax functionality
    else
      respond_to do |format|
        format.html { render 'events/show' }
        format.js
      # render 'events/show'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
