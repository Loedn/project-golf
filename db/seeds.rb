# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.destroy_all
User.destroy_all
Event.destroy_all
user = User.create!(email: 'jchoongnw@gmail.com', password: '123456', first_name: 'Jess', last_name: 'Choong')

course = Course.create!(name: 'Asiago', address: '16 Villa Gaudelet, Paris', description: "good golf course, the best one", price: 125.0, owner_id: 1)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course
  hole.save!
end
event = Event.create!(course: course, user: user)
