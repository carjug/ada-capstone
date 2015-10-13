require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { build(:user) }

  describe "login" do
    it "returns success" do
      user.save!
      get :create, user: {
        id:       user.id,
        username: user.username,
        password: user.password,
        password_confirmation: user.password_confirmation
        }

      expect(response.status).to eq 200
    end
  end
end
