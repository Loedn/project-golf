# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
Course.destroy_all
User.destroy_all


user = User.create!(email: 'test@test.com', password: '123456', first_name: 'Super', last_name: 'User')

course1 = Course.create!(image:"image/upload/v1504274734/colli.jpg", name: 'G.C. Colli Berici', address: 'Str. Monti Comunali, 36040 Brendola VI, Italia', description: "The Golf Club is located in a privileged position, both for the scenic landscape setting between the Berici Hills and for the easy access given by the proximity to the Montecchio Maggiore motorway exit, just a short distance from the historic center of Vicenza. The route runs on 18 holes at an altitude of 300 m above sea level, enclosed in the hills of the municipalities of Brendola and Altavilla. The first nine holes, overlooking the plain terrace around Vicenza, enjoy the enchanting panorama offered by the Lessini Mountains and the Little Dolomites; While the second nine go into a thick and relaxing forest of oaks, hornbeams and chestnut trees.", price: 45.00, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course1
  hole.save!
end

course2 = Course.create!(image:"image/upload/v1504274733/asiago.jpg", name: 'G.C. Asiago', address: 'Via Meltar, 2, 36012 Asiago VI, Italia', description: "Located at an altitude of 1000 meters in the nature paradise of the Asiago Plateau, nestled within and surrounded by pine forests, natural clearings and woods, the Asiago Golf Course is an 18 holes course which offer an extraordinary, all-round, golf experience… A beautiful course, world-class facilities and services for practicing and training, a magnificent Club House with all comforts, a superb cuisine, a 4star boutique hotel and wellness centre where to rest and relax.
Asiago, golf as you have never known!", price: 80.00, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course2
  hole.save!
end

course3 = Course.create!(image:"image/upload/v1504274734/shooters.jpg", name: 'G.C. Shooters Hill', address: 'Eaglesfield Rd, London SE18 3DA', description: "Shooter's Hill GC is an attractive parkland course situated close to Blackheath, with superb views across the North Kent countryside. The course is a challenging but fair test of golf, good shot selection is critical for a good score. The course has a number of challenging holes. Our signature hole is the picturesque tenth (shown right) which is included in our own Amen Corner consisting of three par 3's each different to the others and each very demanding. Completing these in par is essential to scoring a good round.", price: 45, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course3
  hole.save!
end

course4 = Course.create!(image:"image/upload/v1504274733/muswell.jpg", name: 'G.C. Muswell Hill', address: 'Rhodes Avenue, London N22 7UT', description: "Muswell Hill is a Par 71 (men) and Par 73 (ladies) parkland course. Off the back tees it is sufficiently challenging to test the very best golfer, but it can also offer a more forgiving experience to the less gifted majority. It has earned its reputation for being beautifully maintained.", price: 35, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course4
  hole.save!
end

course5 = Course.create!(image:"image/upload/v1504274733/highgate.jpg", name: 'G.C. Highgate', address: 'Denewood Rd, Highgate, London N6 4AH', description: "Opened in 1904, this hilly, tree-lined parkland course originally designed by C.S. Butchart has retained many of its original features. The course layout was fundamentally changed when in 1928 the Metropolitan Water Board built the Bishopswood Reservoir around the area that is now the 10th and 13th holes. This reservoir currently stores 40 million litres of water to supply North London with drinking water. The course currently measures 6,015 yards with a par and standard scratch of 69 with the ladies at just over 5,400 yards with par 72 standard scratch 72. To demonstrate the test of golf Highgate offers those who play it, the current amateur course record of 66 was first scored in 1984 and whilst equalled on a number of occasions still remains the toughest record to beat.", price: 80, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course5
  hole.save!
end

course6 = Course.create!(image:"image/upload/v1504274733/finchley.jpg", name: 'G.C. Finchley', address: 'Nether Court, Frith Ln, London NW7 1PU', description: "The 18 hole course is laid out in mature parkland. The holes are lined with a variety of trees which bring colour, definition and visual impact to the course. The clubhouse was once home to a Victorian industrialist, Henry Tubbs, with strong business links to Canada. The trees, bushes and shrubs on the course close to the clubhouse near the 1st, 12th, and 18th greens reflect that connection and are all indigenous to North America. The variety of trees close to the fountain on the 12th hole, in particular, have been brought together for deliberate visual appeal. The course is home to a range of urban wildlife including Muntjac deer, foxes and squirrels. The course itself plays fairly tight overall. There are slopes on many of the fairways and on the greens. To play the course well therefore requires a player to find relatively small landing areas. The greens are renowned locally for their pace, trueness and generally excellent condition.", price: 45, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course6
  hole.save!
end

course7 = Course.create!(image:"image/upload/v1504274733/london.jpg", name: 'G.C. London', address: 'Stansted Lane, Ash, Nr Brands Hatch, Kent TN15 7EH', description: "A classic Jack Nicklaus course, which forces you to consider every shot. Dramatic tee shots and daunting approaches make this course both memorable and challenging. Host to the 2008 & 2009 European Open, the course is maintained to the very best standards all-year round.", price: 120, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course7
  hole.save!
end

course8 = Course.create!(image:"image/upload/v1504274734/royalblack.jpg", name: 'G.C. Royal Blackheath', address: 'Court Rd, London SE9 5AF', description: "Our beautiful 18 hole parkland course boasts excellent fairways, true greens and challenging holes, whilst the magnificent 17th century Clubhouse - with stunning views across the course - is the perfect place to relax after a game. Situated in a tranquil corner of South East London, Royal Blackheath is just 9 miles from the City of London and is situated near historic Greenwich - home of the National Maritime Museum, Royal Observatory and the Cutty Sark. Whether you are new to the sport or a seasoned player, a warm welcome awaits you at Royal Blackheath Golf Club.", price: 80, owner: user)
18.times do |i|
  hole = Hole.new(name: '#{i+1}', par: 3)
  hole.course = course8
  hole.save!
end

