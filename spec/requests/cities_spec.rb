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

  describe 'GET /reservations/:reservation_id/city' do
    it 'shows the city for a reservation' do
      user = FactoryBot.create(:user)
      city = FactoryBot.create(:city)
      reservation = FactoryBot.create(:reservation, user:, city:)

      get user_reservation_cities_path(user, reservation)

      expect(response).to have_http_status(200)
      expect(response.body).to include(city.name)
    end
  end
end
