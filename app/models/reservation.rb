class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation
  belongs_to :city
end
