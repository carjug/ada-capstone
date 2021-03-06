require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  let(:city)      { build(:city) }
  let(:place)     { build(:place) }
  let(:prov)      { build(:prov) }
  let(:country)   { build(:country) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }

  before :each do
    @categories = [category1, category2, category3]
    @categories.each do |cat|
      place.categories << cat
    end
  end

  describe "POST create" do
    it "creates a place" do
      city.save!
      place.save!

      post :create, place: {
        id: place.id,
        name: place.name,
        city_id: place.city_id
      }

      expect(response.status).to eq 200
      expect(response.header["Content-Type"]).to include "application/json"
    end
  end

  describe "PUT update" do
    it "updates a place" do
      city.save!
      place.save!

      put :update, {
        id: place.id,
        name: "A different name",
        categories: [category1, category2]
      }

      expect(response.status).to eq 200
      expect(response.header["Content-Type"]).to include "application/json"
      expect(response.body).to include ( "A different name" )
    end
  end

  describe "GET find_by_city" do
    it "gets places in a city" do
      country.save!
      prov.save!
      city.save!
      place.save!

      get :find_by_city, {
        city: city.name,
      }

      expect(response.status).to eq 200
      expect(response.header["Content-Type"]).to include "application/json"
    end
  end
end
