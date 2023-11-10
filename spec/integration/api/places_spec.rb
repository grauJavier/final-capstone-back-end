require 'swagger_helper'

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
        let(:user_id) { create(:user).id }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/places' do
    post 'Creates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'User ID'
      parameter name: :place, in: :body, schema: {
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
      }
      response '201', 'place created' do
        let(:user_id) { create(:user).id }
        let(:place) do
          {
            place: {
              city_id: '1',
              name: 'Example Place',
              image_url: 'example.com/image.jpg',
              description: 'Example description'
            },
            details: {
              place_type: 'House',
              bedrooms: 3,
              beds: 2,
              bathrooms: 2,
              property_type: 'Apartment',
              price: 100
            }
          }
        end
        run_test!
      end
    
      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:place) do
          {
            place: {
              city_id: '1',
              name: nil,
              image_url: 'example.com/image.jpg',
              description: 'Example description'
            },
            details: {
              place_type: 'House',
              bedrooms: 3,
              beds: 2,
              bathrooms: 2,
              property_type: 'Apartment',
              price: 100
            }
          }
        end
        run_test!
      end
    end    
  end

  path '/users/{user_id}/places/{id}' do
    put 'Updates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'User ID'
      parameter name: :id, in: :path, type: :string, description: 'Place ID'
      parameter name: :place, in: :body, schema: {
        type: :object,
        properties: {
          place: {
            type: :object,
            properties: {
              city_id: { type: :integer },
              name: { type: :string },
              image_url: { type: :string },
              description: { type: :string }
            }
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
            }
          }
        },
        required: %w[place details]
      }
      response '200', 'place updated' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:place, user_id: user_id).id }
        let(:place) { { city_id: '1', name: 'Updated Place' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:id) { create(:place, user_id: user_id).id }
        let(:place) { { city_id: '1', name: nil } }
        run_test!
      end
    end

    delete 'Deletes a place' do
      tags 'Places'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :id, in: :path, type: :string, description: 'Place ID'
      response '204', 'place deleted' do
        let(:user_id) { create(:user).id }
        let(:place) { create(:place, user_id: user_id) }
        let(:id) { place.id }
        run_test!
      end

      response '404', 'place not found' do
        let(:place) { create(:place) }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end