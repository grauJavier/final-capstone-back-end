require 'rails_helper'

RSpec.describe 'Reservations API', type: :request do
  describe 'GET /users/:user_id/reservations' do
    it 'returns a list of reservations' do
      user = create(:user)
      create_list(:reservation, 3, user:)

      get "/users/#{user.id}/reservations"

      expect(response).to have_http_status(200)

      reservations_json = JSON.parse(response.body)
      expect(reservations_json.length).to eq(3)
    end
  end

  describe 'GET /users/:user_id/reservations/:reservation_id' do
    it 'returns a specific reservation' do
      user = create(:user)
      reservation = create(:reservation, user:)

      get "/users/#{user.id}/reservations/#{reservation.id}"

      expect(response).to have_http_status(200)

      reservation_json = JSON.parse(response.body)
      expect(reservation_json['id']).to eq(reservation.id)
    end
  end

  describe 'POST /users/:user_id/reservations' do
    it 'creates a new reservation' do
      user = create(:user)
      place = create(:place)

      reservation_params = {
        place_id: place.id,
        schedule_date: Date.tomorrow
      }

      post "/users/#{user.id}/reservations", params: { reservation: reservation_params }

      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /users/:user_id/reservations/:reservation_id' do
    it 'updates a reservation' do
      user = create(:user)
      reservation = create(:reservation, user:)
      updated_schedule_date = Date.tomorrow + 2.days

      patch "/users/#{user.id}/reservations/#{reservation.id}", params: {
        reservation: { schedule_date: updated_schedule_date }
      }

      expect(response).to have_http_status(200)
      reservation_json = JSON.parse(response.body)
      expect(reservation_json['schedule_date']).to eq(updated_schedule_date.to_s)
    end
  end

  describe 'DELETE /users/:user_id/reservations/:reservation_id' do
    it 'deletes a reservation' do
      user = create(:user)
      reservation = create(:reservation, user:)

      delete "/users/#{user.id}/reservations/#{reservation.id}"

      expect(response).to have_http_status(200)
      expect { reservation.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
