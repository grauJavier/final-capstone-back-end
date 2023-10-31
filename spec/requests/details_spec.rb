require 'rails_helper'

RSpec.describe 'Details API', type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place, user_id: user.id) }
  let!(:detail) { create(:detail, place_id: place.id) }

  describe 'GET /places/:place_id/details' do
    before { get "/places/#{place.id}/details" }

    it 'returns details' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
      expect(parsed_response['id']).to eq(detail.id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
