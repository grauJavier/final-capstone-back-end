require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:schedule_date) }

    it 'validates that schedule_date is in the future' do
      reservation = build(:reservation, schedule_date: '2020-12-12')
      expect(reservation).to be_invalid
      expect(reservation.errors[:schedule_date]).to include('must be in the future')
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:place) }
  end
end
