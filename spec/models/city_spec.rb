require 'rails_helper'

RSpec.describe City, type: :model do
  let(:prov)  { build(:prov) }
  let(:city)  { build(:city) }
  let(:place) { build(:place) }

  context "when creating a city" do
    it "behaves like an object" do
      expect(city).to be_an_instance_of City
    end

    it "has a name attribute" do
      expect(city.name).to eq "A City"
    end

    it "is associated with a prov" do
      expect(city.prov_id).to eq prov.id
    end

    it "needs a name" do
      city.name = ""

      expect(city).to_not be_valid
    end

    it "needs a prov_id" do
      city.prov_id = ""

      expect(city).to_not be_valid
    end

    it "is associated with a prov_id" do
      prov.save
      city.save

      expect(city).to_not be_valid
    end
  end
end
