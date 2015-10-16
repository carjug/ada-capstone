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

# Adds ~1000 major US cities as seeds
JSON.parse(open("#{Rails.root}/us_cities.json").read).each do |stuff|
  prov = Prov.find_by(abbreviation: stuff['state'])
  city = City.new(name: stuff["title"], prov_id: prov.id, lat_long: stuff["ll"])
  # city.name = stuff['title'],
  # city.lat_long = stuff['ll']
  # city.prov_id = prov.id
  # if city.name.include?("[")
  #   binding.pry
  # end
  city.save!
end

# Place seeds

@city = City.find_by(name: "Salt Lake City")

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


