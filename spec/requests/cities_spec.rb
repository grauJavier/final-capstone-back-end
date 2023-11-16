require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /cities' do
    it 'shows all the cities' do
      city = FactoryBot.create(:city)

      get cities_path

      expect(response).to have_http_status(200)
      expect(response.body).to include(city.name)
    end
  end

  describe 'GET /places/:place_id/city' do
    it 'shows the city for a place' do
      user = FactoryBot.create(:user)
      city = FactoryBot.create(:city)
      place = FactoryBot.create(:place, user:, city:)

      get user_place_cities_path(user, place)

      expect(response).to have_http_status(200)
      expect(response.body).to include(city.name)
    end
  end
end
