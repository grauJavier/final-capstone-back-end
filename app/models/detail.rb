class Detail < ApplicationRecord
  belongs_to :place

  validates :place_type, presence: true
  validates :bedrooms, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :beds, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :bathrooms, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :property_type, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
