require 'swagger_helper'

USER_PARAMS = {
  type: :object,
  properties: {
    user: {
      type: :object,
      properties: {
        username: { type: :string },
        email: { type: :string },
        password: { type: :string }
      },
      required: %w[username email password]
    }
  },
  required: %w[user]
}.freeze

RSpec.describe 'api/users', type: :request do
  path '/signup' do
    post 'Create a new user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: USER_PARAMS
      response '200', 'user created' do
        let(:user) do
          {
            user: {
              username: 'test',
              email: 'example@gmail.com',
              password: 'password123'
            }
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { 'invalid' }
        run_test!
      end
    end
  end
end
