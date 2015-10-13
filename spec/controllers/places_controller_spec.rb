require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  let(:city)      { build(:city) }
  let(:place)     { build(:place) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }

  before do
    @categories = [category1, category2, category3]
  end

  describe "GET find_by_city" do
    it "gets places in a city" do
      city.save!
      @categories.each do |cat|
        place.categories << cat
      end
      place.save!

      get :find_by_city, city: {
        id: city.id
      }

      expect(response.status).to eq 200
    end
  end
end
