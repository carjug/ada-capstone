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
  end

  describe "place type" do
    it "behaves like an object" do
      expect(place_type).to be_an_instance_of PlaceType
    end

    it "has a type attribute" do
      expect(place_type.type).to eq "Food and Drink"
    end
  end
end
