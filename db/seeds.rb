# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# purp = ["Visitor", "Artist", "Organizer"]
# cities = ["Brooklyn", "Queens", "New York", "Long Island City"]
#
# 100.times do
#   i = rand(0..2)
#   c = rand(0..3)
#   User.create(
#     email: Faker::Internet.unique.email,
#     primary_use: purp[i],
#     password: "password",
#     password_confirmation: "password",
#     city: cities[c],
#     state: "NY"
#   )
# end

statements = ["statement
My work explores the relationship between the body and multimedia experiences. With influences as diverse as Caravaggio and Frida Kahlo, new insights are generated from both traditional and modern structures. Ever since I was a student I have been fascinated by the traditional understanding of the zeitgeist. What starts out as yearning soon becomes manipulated into a cacophony of greed, leaving only a sense of decadence and the prospect of a new synthesis. As temporal derivatives become reconfigured through frantic and personal practice, the viewer is left with an epitaph for the inaccuracies of our world.",
   "My work explores the relationship between gender politics and recycling culture. With influences as diverse as Caravaggio and John Cage, new tensions are distilled from both simple and complex meanings. Ever since I was a postgraduate I have been fascinated by the unrelenting divergence of the moment. What starts out as vision soon becomes manipulated into a dialectic of power, leaving only a sense of nihilism and the unlikelihood of a new understanding. As intermittent derivatives become distorted through frantic and academic practice, the viewer is left with a hymn to the darkness of our world.",
    "My work explores the relationship between the tyranny of ageing and unwanted gifts. With influences as diverse as Camus and Frida Kahlo, new synergies are synthesised from both mundane and transcendant dialogues. Ever since I was a pre-adolescent I have been fascinated by the unrelenting divergence of the mind. What starts out as contemplation soon becomes manipulated into a dialectic of defeat, leaving only a sense of nihilism and the unlikelihood of a new reality. As spatial forms become reconfigured through boundaried and critical practice, the viewer is left with an insight into the limits of our existence.",
     "My work explores the relationship between the tyranny of ageing and midlife subcultures. With influences as diverse as Derrida and Frida Kahlo, new variations are created from both orderly and random discourse. Ever since I was a pre-adolescent I have been fascinated by the unrelenting divergence of the zeitgeist. What starts out as yearning soon becomes corrupted into a manifesto of futility, leaving only a sense of dread and the prospect of a new reality. As subtle forms become clarified through boundaried and academic practice, the viewer is left with a hymn to the possibilities of our world.",
      "statement
My work explores the relationship between the universality of myth and vegetarian ethics. With influences as diverse as Rousseau and Francis Bacon, new synergies are created from both explicit and implicit meanings. Ever since I was a teenager I have been fascinated by the essential unreality of relationships. What starts out as contemplation soon becomes manipulated into a cacophony of greed, leaving only a sense of failing and the chance of a new synthesis. As temporal derivatives become transformed through diligent and critical practice, the viewer is left with an epitaph for the possibilities of our future.",
       "My work explores the relationship between consumerist fetishism and emotional memories. With influences as diverse as Kafka and Roy Lichtenstein, new synergies are synthesised from both opaque and transparent meanings. Ever since I was a pre-adolescent I have been fascinated by the ephemeral nature of the moment. What starts out as contemplation soon becomes debased into a tragedy of power, leaving only a sense of dread and the chance of a new order. As intermittent forms become frozen through frantic and academic practice, the viewer is left with a testament to the inaccuracies of our culture."]

User.all.each do |u|
  media = ["Architecture", "Book Arts", "Ceramics", "Conceptual Art", "Craft", "Dance", "Design", "Drawing", "Fashion", "Fiber", "Film and Video", "Illustration", "Installation", "Jewelry", "Mixed Media", "Music", "New Media", "Painting", "Performance", "Photography", "Printmaking", "Relational Art", "Sculpture", "Sound", "Street Art"]
  y = rand(0..24)
  z = rand(0..24)
  a = rand(0..5)
  @profile = u.build_profile(
        :name => Faker::Name.name,
        :portfolio => "http://www.mwissig.com",
        :instagram => "mwissig",
        :statement => statements[a],
        :primary_medium => media[y],
        :secondary_medium => media[z],
  )
  @profile.user_id = u.id,
    @profile.save!
end
#
# 50.times do
#   x = rand(1..100)
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

# Location.create(
#   event_id: 7,
#   user_id: 1,
#   address:
# )
