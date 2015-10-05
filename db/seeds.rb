# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# country = Country.create({name: 'United States'})

# prov = Prov.create({name: 'Utah'})

# city = City.create({name: 'Salt Lake City'})
JSON.parse(open("#{Rails.root}/countries.json").read).each do |stuff|
    country = Country.new()
    country.name = stuff['name']
    country.code = stuff['code']
    country.save!
end

@country = Country.find_by(name: "United States")

JSON.parse(open("#{Rails.root}/states.json").read).each do |stuff|
    state = Prov.new()
    state.name = stuff['name']
    state.abbreviation = stuff['abbreviation']
    state.country_id = @country.id
    state.save!
end

@prov = Prov.find_by(name: "Utah")

@city = City.create({
  name: "Salt Lake City",
  prov_id: @prov.id
  })

JSON.parse(open("#{Rails.root}/city_data/slc.json").read).each do |stuff|
  existing_place = Place.find_by(name: stuff['place'])
  # binding.pry
  if existing_place == nil
    place = Place.new()
    place.name = stuff['place']
    place.city_id = @city.id
    place.save!
  end
end
