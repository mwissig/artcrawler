# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 50.times do
#   i = rand(0..2)
#   purp = ["Visitor", "Artist", "Organizer"]
#   User.create(
#     email: Faker::Internet.unique.email,
#     primary_use: purp[i],
#     password: "password"
#   )
# end
#
User.all.each do |u|
  media = ["Architecture", "Book Arts", "Ceramics", "Conceptual Art", "Craft", "Dance", "Design", "Drawing", "Fashion", "Fiber", "Film and Video", "Illustration", "Installation", "Jewelry", "Mixed Media", "Music", "New Media", "Painting", "Performance", "Photography", "Printmaking", "Relational Art", "Sculpture", "Sound", "Street Art"]
  cities = ["Brooklyn", "Queens", "New York", "Long Island City"]
  y = rand(0..24)
  z = rand(0..24)
  c = rand(0..3)
  @profile = u.build_profile(
        :name => Faker::Name.name,
        :portfolio => "http://www.mwissig.com",
        :instagram => "mwissig",
        :statement => Faker::Lorem.paragraphs(paragraph_count = 2, supplemental = false),
        :primary_medium => media[y],
        :secondary_medium => media[z],
        :city => cities[c],
        :state => "NY"
  )
  @profile.user_id = u.id,
    @profile.save!
end
#
# 50.times do
#   x = rand(6..97)
#   media = ["Architecture", "Book Arts", "Ceramics", "Conceptual Art", "Craft", "Dance", "Design", "Drawing", "Fashion", "Fiber", "Film and Video", "Illustration", "Installation", "Jewelry", "Mixed Media", "Music", "New Media", "Painting", "Performance", "Photography", "Printmaking", "Relational Art", "Sculpture", "Sound", "Street Art"]
#   y = rand(0..24)
#   z = rand(0..24)
#   Profile.create(
#     user_id: x,
#     name: Faker::Name.name,
#     portfolio: "http://www.google.com",
#     instagram: "mwissig",
#     statement: Faker::Lorem.paragraphs(paragraph_count = 2, supplemental = false),
#     primary_medium: media[y],
#     secondary_medium: media[z]
#   )
# end
