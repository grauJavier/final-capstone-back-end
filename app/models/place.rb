class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :image_url, presence: true, format: { with: %r{\Ahttps?://\S+\z}, message: 'Invalid URL format' }
  validates :description, presence: true, length: { minimum: 3, maximum: 255 }
end
