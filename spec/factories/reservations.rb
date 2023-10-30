FactoryBot.define do
    factory :reservation do
      user { create(:user) } 
      place { create(:place) }
      city { create(:city) } 
      schedule_date { Date.tomorrow }
    end
  end
  