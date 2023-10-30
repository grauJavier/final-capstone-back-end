class City < ApplicationRecord
  has_many :reservations

  validates :name, presence: true, length: { maximum: 100 }
end
