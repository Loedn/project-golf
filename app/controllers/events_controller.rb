class EventsController < ApplicationController
  def index
    @events = Event.where(user_id[current_user.id])
  end

  def show
    @event = Event.find(params[:id])
    @invitees = @event.invited_users
    authorize @event
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
    # create event
    new_event = Event.new(event_params)
    new_event.user = current_user
    new_event.course = Course.find(params[:course_id])
    if !new_event.save
      redirect_to :back
    end
    #create invite
    invites_array = []
    new_invite_one = Invite.new(invite_one_params)
    new_invite_one.event = new_event
    invites_array << new_invite_one

    new_invite_two = Invite.new(invite_two_params)
    new_invite_two.event = new_event
    invites_array << new_invite_two

    new_invite_three = Invite.new(invite_three_params)
    new_invite_three.event = new_event
    invites_array << new_invite_three

    valid_array = []
    invites_array.each do |i|
      valid_array << i if !i.user_id.nil?
    end

    if valid_array.count > 0
      final_array = []
      valid_array.each do |i|
        final_array << i.save
      end
    end

    if final_array.all?

      redirect_to event_path(new_event)

    else
      redirect_to :back
    end
  end

private

  def event_params
    params.require(:event).permit(:timeslot)
  end

  def invite_one_params
    params.require(:invite_one).permit!
  end

  def invite_two_params
    params.require(:invite_two).permit!
  end

  def invite_three_params
    params.require(:invite_three).permit!
  end

end
