require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:city)      { build(:city) }
  let(:place)     { build(:place) }
  let(:place1)    { build(:place1) }
  let(:user)      { build(:user) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }
  let(:rating)    { create(:rating) }
  let(:rating1)   { create(:rating1) }


  before :each do
    @categories = [category1, category2, category3]
    @categories.each do |word|
        place.categories.push(word)
        place1.categories.push(word)
    end
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

    it "needs to be associated with a city_id" do
      place.city_id = ""

      expect(place).to_not be_valid
    end

    it "has a categories attribute" do
      place.save!

      expect(place.categories.count).to eq 3
    end

    it "has at least 3 associated categories" do
      place.categories = Category.where(category: "cool")
      expect(place).to_not be_valid
    end

    it "has associated categories" do
      place.save!

      expect(place).to be_valid
      expect(place.categories[0].category).to eq "cool"
    end

    # Scope and model method tests

    it "has a top_places scope" do
      place1.save!
      rating.save!

      expect(Place.top_places.count).to eq 1
      expect(Place.top_places[0].name).to eq "Another Place"
    end

    it "has a top_places_per_city scope" do
      city.save!
      place1.save!
      place.save!
      rating.save!
      rating1.save!

      expect(Place.top_places_per_city(city).count).to eq 2
      expect(Place.top_places_per_city(city)[1].name).to eq "A Place"
    end

    it "has a top_places_per_user scope" do
      user.save!
      city.save!
      place1.save!
      place.save!
      rating.save!
      rating1.save!

      expect(Place.top_places_per_user(user).count).to eq 2
      expect(Place.top_places_per_user(user)[1].name).to eq "A Place"
    end

    it "has access to top 3 most-assigned categories" do
      more_cats = [category1, category1, category2]

      more_cats.each do |word|
        place.categories.push(word)
      end
      place.save!

      expect(place.top_categories_per_place).to eq (
        [["cool", 3],
        ["chill", 2],
        ["serene", 1]]
        )
    end

    # it "needs to have a place_type association" do
    #   place.place_type_id = nil

    #   expect(place).to_not be_valid
    # end
  end
end
