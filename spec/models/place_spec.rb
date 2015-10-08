require 'rails_helper'

RSpec.describe Place, type: :model do
  before :each do
    @city = City.create(name: "A City")
    @place = Place.create(name: "A Place", city_id: @city.id)
  end

  context "when creating a place" do
    it "behaves like an object" do
      expect(@place).to be_an_instance_of Place
    end

    it "has a name attribute" do
      expect(@place.name).to eq "A Place"
    end

    it "is associated with a city" do
      expect(@place.city_id).to eq @city.id
    end

    it "needs a name" do
      @place.name = ""

      expect(@place).to_not be_valid
    end

    it "needs to be associated with a city_id" do
      @place.city_id = ""

      expect(@place).to_not be_valid
    end
  end
end
