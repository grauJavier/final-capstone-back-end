require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /login" do
    it "logs in a user" do
      user = FactoryBot.create(:user)

      post user_session_path, params: { user: { email: user.email, password: user.password } }

      json_response = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(json_response["status"]["message"]).to eq('Logged in successfully.')
    end
  end

  describe "DELETE /logout" do
    it "logs out a user" do
      user = FactoryBot.create(:user)

      post user_session_path, params: { user: { email: user.email, password: user.password } }

      key = response.headers['authorization']

      delete destroy_user_session_path, headers: { 'Authorization': key }

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /signup" do
    it "signs up a user" do
      user_params = FactoryBot.attributes_for(:user)

      post user_registration_path, params: { user: user_params }

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json_response["status"]["message"]).to eq('Signed up successfully.')
    end
  end
end
