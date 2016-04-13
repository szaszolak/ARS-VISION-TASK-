
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
countries = ISO3166::Country.all.to_a
(1..50).each do
	company = Company.create(name:Faker::Company.name, country_code: countries[rand(1..countries.size)].alpha3)
	(1..rand(2..10)).each do
      company.persons.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)  
    end
end

