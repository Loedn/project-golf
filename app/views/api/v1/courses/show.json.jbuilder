json.extract! @course, :id, :name, :description, :address, :latitude, :longitude, :email, :phone, :timeslots, :badges, :price, :disabled_days
json.events @course.events do |event|
  json.extract! event, :id, :timeslot, :title
  json.invites event.invites do |invite|
    json.extract! invite.user, :first_name, :last_name
    json.extract! invite, :id, :status
  end
end
