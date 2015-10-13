require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:city)       { build(:city) }
  let(:place)      { build(:place) }
  let(:category1)  { create(:category1) }
  let(:category2)  { create(:category2) }
  let(:category3)  { create(:category3) }
  let(:place_type) { build(:place_type) }
  let(:rating)     { build(:rating) }

  before :each do
    @categories = [category1, category2, category3]
    @categories.each do |cat|
      place.categories << cat
    end
  end

  describe "rating" do
    it "behaves like an object" do
      expect(rating).to be_an_instance_of Rating
    end

    it "has various rating attributes" do
      expect(rating.overall).to eq 5
      expect(rating.rating1).to eq 4
      expect(rating.rating2).to eq 5
    end

    it "belongs to a user" do
      expect(rating.user_id).to eq 1
    end

    it "belongs to a place" do
      expect(rating.place_id).to eq 4
    end

    it "needs all ratings to be valid" do
      rating.rating1 = nil

      expect(rating).to_not be_valid
    end
  end
end
