# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
40.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'active')
end

40.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'dna')
end

40.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'historical')
end

20.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'compted')
end

20.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'staff')
end

20.times do
  Member.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, scene_name:Faker::Internet.user_name , join_date: Faker::Date.between(4.years.ago, Date.today), renewal_date: Faker::Date.forward(360), status: 'guest')
end
