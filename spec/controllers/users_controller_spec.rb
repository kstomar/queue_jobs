require 'rails_helper'

RSpec.describe UsersController do
 
  describe "Post 'create'" do
    it "create user" do
      user_params  = attributes_for(:user)
      params = { users: user_params }
      post :create , params: params
      expect(response.status).to eq(200)
    end

    it "should not create account if params are not valid" do
      user_params  = attributes_for(:user, email: nil)
      params = { users: user_params }
      post :create , params: params
      body = JSON.parse(response.body)
      expect(body["errors"].present?).to eq(true)
      expect(response.status).to eq(422)
    end
  end
end