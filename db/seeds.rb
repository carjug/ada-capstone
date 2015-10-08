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
  if existing_place == nil
    place = Place.new()
    place.name = stuff['place']
    place.city_id = @city.id
    place.save!
  end
end
