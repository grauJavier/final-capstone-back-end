require 'swagger_helper'

RSpec.describe 'api/details', type: :request do
  path '/places/{place_id}/details' do
    get 'Retrieves details for a specific place' do
      tags 'Details'
      produces 'application/json'
      parameter name: :place_id, in: :path, type: :integer, description: 'Place ID'
      response '200', 'details found' do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let(:place_id) { create(:place, user_id:).id }
        run_test!
      end
    end
  end
end
