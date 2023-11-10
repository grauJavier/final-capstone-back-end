require 'swagger_helper'

RSpec.describe 'api/details', type: :request do
  path '/places/{place_id}/details' do
    get 'Retrieves details for a specific place' do
      tags 'Details'
      produces 'application/json'
      parameter name: :place_id, in: :path, type: :integer, description: 'Place ID'
      response '200', 'details found' do
        schema type: :object,
               properties: {
                 place: {
                   type: :object,
                   properties: {
                     name: { type: :string },
                     user_id: { type: :integer },
                     image_url: { type: :string },
                     description: { type: :string },
                     city: {
                       type: :object,
                       properties: {
                         name: { type: :string },
                         id: { type: :integer }
                       },
                       required: %w[name id]
                     }
                   },
                   required: %w[name user_id image_url description city]
                 }
               }
        let(:place_id) { create(:place).id }
        run_test!
      end

      response '404', 'details not found' do
        let(:place_id) { 'invalid' }
        run_test!
      end
    end
  end
end