require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let(:city)   { build(:city) }
  let(:prov)   { build(:prov) }
  let(:place)  { build(:place) }
  let(:place1) { build(:place1) }
  let(:category1) { build(:category1) }
  let(:category2) { build(:category2) }
  let(:category3) { build(:category3) }


  before :each do
    @categories = [category1, category2, category3]
    @categories.each do |cat|
      place.categories << cat
      place1.categories << cat
    end
  end

  describe "POST create" do
    it "creates a city" do
      prov.save!
      place.save!

      post :create, city: {
        id: city.id,
        name: city.name,
        prov_id: prov.id,
        places: [place]
      }

      expect(response.status).to eq 200
      expect(response.header["Content-Type"]).to include "application/json"
      expect(city.places.count).to eq 1
    end
  end

  describe "PUT update" do
    it "updates a city" do
      prov.save!
      city.save!
      place.save!
      place1.save!

      put :update, {
        id: city.id,
        name: "A different city",
        places: [place, place1]
      }

      expect(response.status).to eq 200
      expect(response.header["Content-Type"]).to include "application/json"
      expect(response.body).to include ( "A different city" )
      expect(city.places.count).to eq 2
    end
  end

end
