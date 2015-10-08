require 'rails_helper'

RSpec.describe Place, type: :model do
    let(:city)      { build(:city) }
    let(:place)     { build(:place) }
    let(:category1) { create(:category1) }
    let(:category2) { create(:category2) }
    let(:category3) { create(:category3) }

  before do
    @categories = [category1, category2, category3]
  end

  context "when creating a place" do
    it "behaves like an object" do
      expect(place).to be_an_instance_of Place
    end

    it "has a name attribute" do
      expect(place.name).to eq "A Place"
    end

    it "is associated with a city" do
      expect(place.city_id).to eq city.id
    end

    it "needs a name" do
      place.name = ""

      expect(place).to_not be_valid
    end

    it "is associated with a city_id" do
      place.city_id = ""

      expect(place).to_not be_valid
    end

    it "has a categories attribute" do
      expect(place.categories).to eq []
    end

    it "has at least 3 associated categories" do
      place.categories = Category.where(category: "cool")
      expect(place).to_not be_valid
    end

    it "has associated categories" do
      @categories.each do |word|
        place.categories.push(word)
      end

      expect(place).to be_valid
      expect(place.categories[0].category).to eq "cool"
    end
  end
end
