# spec/factories/reservations.rb
FactoryBot.define do
  factory :reservation do
    user
    place
    city
    schedule_date { Date.today }
  end
end
