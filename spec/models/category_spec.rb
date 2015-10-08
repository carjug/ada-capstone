require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:city)      { build(:city) }
  let(:place)     { build(:place) }
  let(:category1) { create(:category1) }
  let(:category2) { create(:category2) }
  let(:category3) { create(:category3) }

  before do
    @categories = [category1, category2, category3]
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

    # it "needs to be associated with a city_id" do
    #   category.city_id = ""

    #   expect(category).to_not be_valid
    # end

    # it "has a categories attribute" do
    #   expect(category.categories).to eq []
    # end

    # it "has at least 3 associated categories" do
    #   category.categories = Category.where(category: "cool")
    #   expect(category).to_not be_valid
    # end

    # it "has associated categories" do
    #   @categories.each do |word|
    #     category.categories.push(word)
    #   end

    #   expect(category).to be_valid
    #   expect(category.categories[0].category).to eq "cool"
    # end
  end
end
