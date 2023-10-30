require 'faker'

FactoryBot.define do
  factory :place do
    name { Faker::Lorem.words(number: 3).join(' ') }
    image_url { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    user
  end
end
