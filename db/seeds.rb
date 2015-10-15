# Country seeds

JSON.parse(open("#{Rails.root}/countries.json").read).each do |stuff|
    country = Country.new()
    country.name = stuff['name']
    country.code = stuff['code']
    country.save!
end

@country = Country.find_by(name: "United States")

# Adds states of the US to the Provs table

JSON.parse(open("#{Rails.root}/states.json").read).each do |stuff|
    state = Prov.new()
    state.name = stuff['name']
    state.abbreviation = stuff['abbreviation']
    state.country_id = @country.id
    state.save!
end

@prov = Prov.find_by(name: "Utah")

#Seeding database with Salt Lake City as the only city

@city = City.find_or_create_by({
  name: "Salt Lake City",
  prov_id: @prov.id
  })

# Place seeds

JSON.parse(open("#{Rails.root}/city_data/slc.json").read).each do |stuff|
  existing_place = Place.find_by(name: stuff['place'])
  if existing_place == nil
    place = Place.new()
    place.name = stuff['place']
    place.city_id = @city.id
    place.save!
  end
end

# Categories seeds

JSON.parse(open("#{Rails.root}/categories.json").read).each do |stuff|
  category = Category.new()
  category.category = stuff['category']
  category.save!
end


