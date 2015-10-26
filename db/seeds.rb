# Country seeds
JSON.parse(open("#{Rails.root}/countries.json").read).each do |stuff|
    country = Country.new()
    country.name = stuff['name']
    country.code = stuff['code']
    country.save!
end

@country = Country.find_by(name: "United States")

# States of the US to the Provs table
JSON.parse(open("#{Rails.root}/states.json").read).each do |stuff|
    state = Prov.new()
    state.name = stuff['name']
    state.abbreviation = stuff['abbreviation']
    state.country_id = @country.id
    state.save!
end

@prov = Prov.find_by(name: "Utah")

# City seeds --  adds ~1000 of major US cities
JSON.parse(open("#{Rails.root}/us_cities.json").read).each do |stuff|
  unless stuff["title"] == "Survey"
    prov = Prov.find_by(abbreviation: stuff['state'])
    if prov == nil
      binding.pry
    end
    city = City.new(name: stuff["title"], prov_id: prov.id, lat_long: stuff["ll"])
  end
  city = City.new(name: stuff["title"], prov_id: 1, lat_long: stuff["ll"])
  city.save!
end

@city = City.find_by(name: "Salt Lake City")

# PlaceType seeds

PlaceType.create(description: "Survey")
PlaceType.create(description: "Food/Drink")
PlaceType.create(description: "Recreation")
PlaceType.create(description: "Uncategorized")

# Place seeds currently only for Salt Lake City
JSON.parse(open("#{Rails.root}/city_data/slc.json").read).each do |stuff|
  existing_place = Place.find_by(name: stuff['place'])
  if existing_place == nil
    place = Place.new()
    place.name = stuff['place']
    if place.name == "Survey"
      place.city_id = 1
    else
      place.city_id = @city.id
    end
    place.place_type_id = 4
    place.save!
  end
end

# Categories seeds
JSON.parse(open("#{Rails.root}/categories.json").read).each do |stuff|
  category = Category.new()
  category.category = stuff['category']
  category.save!
end

# User seeds
CSV.foreach("db/user_seed_data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
    User.create(row.to_hash)
end

# Question seeds
CSV.foreach("db/questions_seed_data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
    Question.create(row.to_hash)
end

# responses
CSV.foreach("db/resp_seed_data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
    Response.create(
      response: row[:response],
      question_id: row[:question_id],
      place_id: row[:place_id],
      user_id: row[:user_id]
    )
end






