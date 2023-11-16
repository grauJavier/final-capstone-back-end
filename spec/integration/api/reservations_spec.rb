require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path '/users/{user_id}/reservations' do
    get 'Retrieves a list of reservations' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      response '200', 'reservations found' do
        schema type: :array,
               items: {
                 properties: {
                   place: {
                     type: :object,
                     properties: {
                       name: { type: :string },
                       image_url: { type: :string },
                       description: { type: :string },
                       city: {
                         type: :object,
                         properties: {
                           name: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }
        let(:user_id) { create(:user).id }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          place_id: { type: :integer },
          schedule_date: { type: :string, format: :date }
        },
        required: %w[place_id schedule_date]
      }
      response '200', 'reservation created' do
        let(:user_id) { create(:user).id }
        let(:reservation) { { place_id: create(:place).id, schedule_date: '2023-12-31' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user_id) { create(:user).id }
        let(:reservation) { { place_id: nil, schedule_date: 'invalid' } }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :id, in: :path, type: :integer, description: 'Reservation ID'
      response '200', 'reservation found' do
        let(:user) { create(:user) }
        let(:user_id) { user.id }
        let(:reservation) { create(:reservation, user_id:) }
        let(:id) { reservation.id }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    put 'Updates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :id, in: :path, type: :integer, description: 'Reservation ID'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          place_id: { type: :integer },
          schedule_date: { type: :string, format: :date }
        }
      }
      response '200', 'reservation updated' do
        let(:user_id) { create(:user).id }
        let(:reservation) { create(:reservation, user_id:) }
        let(:id) { reservation.id }
        let(:reservation_params) { { place_id: create(:place).id, schedule_date: '2023-12-31' } }
        run_test!
      end

      response '404', 'invalid request' do
        let(:user_id) { 'invalid' }
        let(:reservation) { 'invalid' }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      parameter name: :user_id, in: :path, type: :integer, description: 'User ID'
      parameter name: :id, in: :path, type: :integer, description: 'Reservation ID'
      response '200', 'reservation deleted' do
        let(:user_id) { create(:user).id }
        let(:reservation) { create(:reservation, user_id:) }
        let(:id) { reservation.id }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:user_id) { create(:user).id }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
