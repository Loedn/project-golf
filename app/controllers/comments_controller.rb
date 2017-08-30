class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.event = @event
    if @comment.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
