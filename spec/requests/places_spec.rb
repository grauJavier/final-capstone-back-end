require 'rails_helper'

RSpec.describe 'Places API', type: :request do
  let(:user) { create(:user) }
  let!(:places) { create_list(:place, 10, user_id: user.id) }
  let(:place_id) { places.first.id }

  describe 'GET /places' do
    before { get '/places' }

    it 'returns places' do
      expect(response.body).not_to be_empty
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /places/:id' do
    before { get "/places/#{place_id}" }

    context 'when the record exists' do
      it 'returns the place' do
        expect(response.body).not_to be_empty
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eq(place_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
