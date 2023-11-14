require 'swagger_helper'

RSpec.describe 'api/cities', type: :request do
  path '/cities' do
    get 'Retrieves a list of cities' do
      tags 'Cities'
      produces 'application/json'
      response '200', 'cities found' do
        schema type: :array,
               items: {
                 properties: {
                   name: { type: :string }
                 }
               }
        run_test!
      end
    end
  end

  path '/users/{user_id}/places/{place_id}/city' do
    get 'Retrieves a city' do
      tags 'Cities'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string,
                description: 'User ID'
      parameter name: :place_id, in: :path, type: :string, description: 'Place ID'
      response '200', 'city found' do
        let(:user_id) { create(:user).id }
        let(:place_id) { create(:place, user_id:).id }
        run_test!
      end
    end
  end
end
