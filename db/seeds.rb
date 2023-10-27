# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User
user = User.create!(username: 'Javier', email:'graujavier@gmail.com', password:'123456')

# Place
image_url = 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/131210897.jpg?k=96dae0b1bb492a08ca3d2983d4c0f9ab91da5cf75d0921a1267160524a5b4d58&o=&hp=1'
place = Place.create!(user: user, name: 'Hotel', image_url: image_url, description: 'Hotel description');
Detail.create!(place: place, place_type: 'Room', bedrooms: 2, beds: 2, bathrooms: 1, property_type: 'Hotel', price: 120);

# City
cities = [
  'New York City, USA',
  'London, UK',
  'Paris, France',
  'Tokyo, Japan',
  'Sydney, Australia',
  'Shanghai, China',
  'Berlin, Germany',
  'Rome, Italy',
  'Hong Kong, China',
  'Dubai, UAE',
  'Istanbul, Turkey',
  'Singapore',
  'Beijing, China',
  'Seoul, South Korea',
  'Moscow, Russia'
]

cities.each do |city_name|
  City.create!(name: city_name)
end

city = City.find_by(name: 'Tokyo, Japan')

# Reservation
Reservation.create!(user: user, place: place, city: city, schedule_date:'2023-12-12')

puts 'Seeds created successfully!'
