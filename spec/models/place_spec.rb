require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:city) }
  it { should have_one(:detail).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(255) }
  it { should validate_presence_of(:image_url) }
  it { should allow_value('http://example.com').for(:image_url) }
  it { should_not allow_value('invalid_url').for(:image_url) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(3).is_at_most(255) }
end
