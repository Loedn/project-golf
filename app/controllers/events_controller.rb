class EventsController < ApplicationController
  def index
    @events = Event.where(user_id[current_user.id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def destroy
    @event = Event.destroy(params[:id])
    redirect_to events_path
  end

  def create
    @event = Event.new(event_params)
    @event.course = params[:id]
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

private

  def event_params
    params.require(:event).permit(:timeslot)
  end
end
