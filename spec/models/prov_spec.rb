require 'rails_helper'

RSpec.describe Prov, type: :model do
  let(:place)     { build(:place) }
  let(:city)      { build(:city) }
  let(:country)   { build(:country) }
  let(:prov)      { build(:prov) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }

  before do
    @categories = [category1, category2, category3]
  end

  context "when creating a prov" do
    it "behaves like an object" do
      expect(prov).to be_an_instance_of Prov
    end

    it "has a name attribute" do
      expect(prov.name).to eq "A Prov"
    end

    it "has a country associated with it" do
      country.save
      prov.save

      expect(prov.country_id).to eq country.id
    end

    it "has cities associated with it" do
      prov.save
      city.save

      expect(prov.cities.count).to eq 1
      expect(prov.cities[0].name).to eq "A City"
    end

    it "needs a name" do
      prov.name = ""

      expect(prov).to_not be_valid
    end

    it "needs a country" do
      prov.country_id = ""

      expect(prov).to_not be_valid
    end

    it "is associated with places" do
      @categories.each do |word|
        place.categories.push(word)
      end

      place.save
      city.save
      prov.save

      expect(prov.places.count).to eq 1
      expect(prov.places[0].name).to eq "A Place"
    end
  end

end
