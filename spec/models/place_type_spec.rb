require 'rails_helper'

RSpec.describe PlaceType, type: :model do
  let(:city)       { build(:city) }
  let(:place)      { build(:place) }
  let(:category1)  { create(:category1) }
  let(:category2)  { create(:category2) }
  let(:category3)  { create(:category3) }
  let(:place_type) { build(:place_type) }


  before :each do
    @categories = [category1, category2, category3]
    @categories.each do |cat|
      place.categories << cat
    end
  end

  describe "place type" do
    it "behaves like an object" do
      expect(place_type).to be_an_instance_of PlaceType
    end

    it "has a type attribute" do
      expect(place_type.type).to eq "Food and Drink"
    end

    it "has axis attributes" do
      expect(place_type.axis1).to eq "Ambience"
    end

    it "has associated places" do
      place_type.save!
      place.save!
      expect(place_type.places.count).to eq 1
      expect(place_type.places[0].name).to eq "A Place"
    end
  end
end
