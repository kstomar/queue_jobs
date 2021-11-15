require 'rails_helper'

RSpec.describe LoginController do
  let(:user) { create(:user) }

  describe "Post 'create'" do
    it "user should login" do
      params = { user: { username: user.email, password: "password" } }
      post :create , params: params
      expect(response.status).to eq(200)
    end

    it "login failure" do
      params = { user: { username: user.email, password: "password1" } }
      post :create , params: params
      expect(response.status).to eq(422)
    end
  end
end