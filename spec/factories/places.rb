require 'faker'

FactoryBot.define do
  factory :place do
    name { Faker::Lorem.word }
    image_url { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    user
  end
end
