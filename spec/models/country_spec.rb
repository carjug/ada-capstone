require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:place)   { build(:place) }
  let(:city)    { build(:city) }
  let(:prov)    { build(:prov) }
  let(:country) { build(:country) }

  context "when creating a country" do
    it "behaves like an object" do
      expect(country).to be_an_instance_of Country
    end

    it "has a name attribute" do
      expect(country.name).to eq "A Country"
    end

    it "has provs associated with it" do
      prov.save
      country.save

      expect(country.provs.count).to eq 1
      expect(country.provs[0].name).to eq "A Prov"
    end

    it "needs a name" do
      country.name = ""

      expect(country).to_not be_valid
    end

    it "is associated with cities" do
      prov.save
      city.save
      country.save

      expect(country.cities.count).to eq 1
      expect(country.cities[0].name).to eq "A City"
    end
  end
end
