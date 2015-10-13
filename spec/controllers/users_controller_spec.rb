require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { build(:user) }

  describe "POST register" do
    it "returns success" do
      post :create, user: {
        username: user.username,
        password: user.password,
        password_confirmation: user.password_confirmation
        }

      expect(response.status).to eq 200
      expect(User.count).to eq 1
    end
  end
end
