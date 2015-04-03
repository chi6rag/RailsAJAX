# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.delete_all

10.times do
	Task.create!(description: Faker::Lorem.sentence(7),
               deadline: Faker::Time.between(Time.now, Time.now+5.days))
end