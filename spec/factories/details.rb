require 'faker'

FactoryBot.define do
  factory :detail do
    place_type { Faker::Lorem.word }
    bedrooms { Faker::Number.between(from: 1, to: 10) }
    beds { Faker::Number.between(from: 1, to: 10) }
    bathrooms { Faker::Number.between(from: 1, to: 10) }
    property_type { Faker::Lorem.word }
    price { Faker::Number.between(from: 50, to: 500) }
    place
  end
end
