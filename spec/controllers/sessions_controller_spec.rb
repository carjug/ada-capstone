require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { build(:user) }

  # POST /login
  describe "login" do
    it "returns success" do
      user.save!
      post :create, user: {
        id:       user.id,
        username: user.username,
        password: user.password,
        password_confirmation: user.password_confirmation
        }

      expect(response.status).to eq 200
      expect(session[:user_id]).to eq user.id
    end
  end
end
