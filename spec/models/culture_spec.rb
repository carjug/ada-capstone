require 'rails_helper'

RSpec.describe Culture, type: :model do
  let(:culture) { build(:culture) }
  let(:user)    { build(:user) }

  context "when creating a culture" do
    it "behaves like an object" do
      expect(culture).to be_an_instance_of Culture
    end

    it "has a title attribute" do
      expect(culture.title).to eq "A Culture"
    end

    it "has a description attribute" do
      expect(culture.description).to eq "A description"
    end

    it "has a users collection" do
      expect(culture.users).to eq []
    end

    it "has associated users" do
      culture.save
      user.save

      expect(culture.users.count).to eq 1
      expect(culture.users[0].username).to eq "A User"
    end
  end
end
