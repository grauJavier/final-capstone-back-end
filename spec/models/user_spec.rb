require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it 'validates that username is not empty' do
      user = build(:user, username: "")
      expect(user).to be_invalid
    end

    it 'validates that the username has a maximun length of 150' do
      user = build(:user, username: "aaaaa"*35)
      expect(user).to be_invalid
    end
  end

  describe 'associations' do
    it { should have_many(:reservations) }
    it { should have_many(:places) }
  end
end
