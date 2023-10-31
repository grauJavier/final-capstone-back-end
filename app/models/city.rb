class City < ApplicationRecord
  has_many :reservations
  has_many :places

  validates :name, presence: true, length: { maximum: 100 }
end
