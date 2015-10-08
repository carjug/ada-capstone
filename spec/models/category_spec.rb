require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:city)      { build(:city) }
  let(:place)     { build(:place) }
  let(:place1)    { build(:place1) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }

  before do
    @categories = [category1, category2, category3]
    @places     = [place, place1]
  end

  context "when creating a category" do
    it "behaves like an object" do
      expect(category1).to be_an_instance_of Category
    end

    it "has a category attribute" do
      expect(category1.category).to eq "cool"
    end

    it "needs a category" do
      category1.category = ""

      expect(category1).to_not be_valid
    end

    it "has a places attribute" do
      expect(category1.places).to eq []
    end

    it "has associated places" do
      @categories.each do |word|
        place.categories.push(word)
        place1.categories.push(word)
      end
      place.save
      place1.save

      expect(category1.places.count).to eq 2
      expect(category1.places[0].name).to eq "A Place"
    end
  end
end
