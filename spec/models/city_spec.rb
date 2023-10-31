require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }

    it 'validates that name is not empty' do
      city = build(:city, name: '')
      expect(city).to be_invalid
      expect(city).to be_invalid
    end

    it 'validates that the name has a maximun length of 100' do
      city = build(:city, name: 'aaaaa' * 25)
      expect(city).to be_invalid
    end
  end

  describe 'associations' do
    it { should have_many(:places) }
  end
end
