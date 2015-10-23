require 'rails_helper'

RSpec.describe User, type: :model do
  let(:culture)   { build(:culture) }
  let(:user)      { build(:user) }
  let(:response)  { build(:response) }

  context "when creating a user" do
    it "behaves like an object" do
      expect(user).to be_an_instance_of User
    end

    it "has a name attribute" do
      expect(user.username).to eq "A User"
    end

    it "is associated with a culture" do
      expect(user.culture_id).to eq culture.id
    end

    it "needs a name" do
      user.username = ""

      expect(user).to_not be_valid
    end

    it "has a responses association" do
      user.save!
      rating.save!

      expect(user.responses.count).to eq 1
    end

  end
end
