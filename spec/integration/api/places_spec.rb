require 'swagger_helper'

PLACE_SCHEMA = {
  type: :object,
  properties: {
    place: {
      type: :object,
      properties: {
        city_id: { type: :integer },
        name: { type: :string },
        image_url: { type: :string },
        description: { type: :string }
      },
      required: %w[city_id name image_url description]
    },
    details: {
      type: :object,
      properties: {
        place_type: { type: :string },
        bedrooms: { type: :integer },
        beds: { type: :integer },
        bathrooms: { type: :integer },
        property_type: { type: :string },
        price: { type: :integer }
      },
      required: %w[place_type bedrooms beds bathrooms property_type price]
    }
  },
  required: %w[place details]
}.freeze

def place_valid_response
  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:place) { create(:place, user_id:) }
end

def place_invalid_response
  let(:user_id) { -678 }
  let(:place) { nil }
  run_test!
end

RSpec.describe 'api/places', type: :request do
  path '/places' do
    get 'Retrieves a list of places' do
      tags 'Places'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :string, description: 'User ID'
      response '200', 'places found' do
        schema type: :array,
               items: {
                 properties: {
                   city: { name: { type: :string } },
                   name: { type: :string },
                   image_url: { type: :string },
                   description: { type: :string }
                 }
               }
        let(:user_id) { create(:user).id }
        run_test!
      end
    end
  end

  path '/places/{id}' do
    get 'Retrieves a place' do
      tags 'Places'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Place ID'
      response '200', 'place found' do
        let(:place) { create(:place) }
        let(:id) { place.id }
        run_test!
      end

      response '404', 'place not found' do
        let(:id) { 'invalid' }
      end
    end
  end

  path '/users/{user_id}/places' do
    post 'Creates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'User ID'
      parameter name: :place, in: :body, schema: PLACE_SCHEMA

      response '201', 'place created' do
        place_valid_response
      end

      response '400', 'invalid request' do
        place_invalid_response
      end
    end
  end

  path '/users/{user_id}/places/{id}' do
    put 'Updates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'User ID'
      parameter name: :id, in: :path, type: :string, description: 'Place ID'
      parameter name: :place, in: :body, schema: PLACE_SCHEMA

      response '200', 'place updated' do
        let(:user_id) { create(:user).id }
        let(:place) { create(:place, user_id:) }
        let(:id) { place.id }
        run_test!
      end

      response '404', 'invalid request' do
        let(:user_id) { 'invalid' }
        let(:place) { 'invalid' }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/places/{id}' do
    delete 'Deletes a place' do
      tags 'Places'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :id, in: :path, type: :string, description: 'Place ID'

      response '204', 'place deleted' do
        let(:user_id) { create(:user).id }
        let(:place) { create(:place, user_id:) }
        let(:id) { place.id }
        run_test!
      end

      response '404', 'place not found' do
        let(:user_id) { 'invalid' }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
