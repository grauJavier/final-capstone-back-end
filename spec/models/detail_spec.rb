require 'rails_helper'

RSpec.describe Detail, type: :model do
  it { should belong_to(:place) }

  it { should validate_presence_of(:place_type) }
  it { should validate_presence_of(:bedrooms) }
  it { should validate_numericality_of(:bedrooms).only_integer.is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:beds) }
  it { should validate_numericality_of(:beds).only_integer.is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:bathrooms) }
  it { should validate_numericality_of(:bathrooms).only_integer.is_greater_than_or_equal_to(1) }
  it { should validate_presence_of(:property_type) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).only_integer.is_greater_than_or_equal_to(0) }
end
