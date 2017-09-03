class EventsController < ApplicationController
  def index
    @events = Event.where(user_id[current_user.id])
  end

  def show
     @event = Event.find(params[:id])
     @course = @event.course
     @invitees = @event.invited_users
     @comment = Comment.new
     authorize @event
   end


  def new
    @event = Event.new
  end

  def destroy
    @event = Event.destroy(params[:id])
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
  end

  def create
    @event = Event.new(event_params)

    @event.user = current_user
    @event.course = Course.find(params[:course_id])
    invites_names = "" # event title string with invites names
    if params[:event][:invited_user_ids]
      params[:event][:invited_user_ids].each do |id|
        invites_names += ", #{User.find(id).first_name}"
      end
    end
    @event.title = "#{@event.course.name} day with #{current_user.first_name}#{invites_names}"
    authorize @event
    if @event.save
      Invite.create(user: current_user, event: @event, status: 'paid')
      unless params[:event][:invited_user_ids].nil?
        params[:event][:invited_user_ids].each do |id|
          Invite.create(user: User.find(id), event: @event, status: 'payment-pending')
        end
        @event.balance = @event.course.price * @event.invites.size
        @event.save
      end
      redirect_to event_path(@event)
    else
      render :new
    end
    # # create event
    # new_event = Event.new(event_params)
    # new_event.user = current_user
    # new_event.course = Course.find(params[:course_id])
    # if !new_event.save
    #   redirect_to :back
    # end
    # #create invite
    # invites_array = []
    # new_invite_one = Invite.new(invite_one_params)
    # new_invite_one.event = new_event
    # invites_array << new_invite_one
    #
    # new_invite_two = Invite.new(invite_two_params)
    # new_invite_two.event = new_event
    # invites_array << new_invite_two
    #
    # new_invite_three = Invite.new(invite_three_params)
    # new_invite_three.event = new_event
    # invites_array << new_invite_three
    #
    # valid_array = []
    # invites_array.each do |i|
    #   valid_array << i if !i.user_id.nil?
    # end
    #
    # if valid_array.count > 0
    #   final_array = []
    #   valid_array.each do |i|
    #     final_array << i.save
    #   end
    # end
    #
    # if final_array.all?
    #
    #   redirect_to event_path(new_event)
    #
    # else
    #   redirect_to :back
    # end
  end

private

  def event_params
    params.require(:event).permit(:timeslot, :title)
  end


end
