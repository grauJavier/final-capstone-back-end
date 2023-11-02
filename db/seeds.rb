# Seed User
user = User.find_or_create_by!(email: 'graujavier@gmail.com') do |u|
  u.username = 'Javier'
  u.password = '123456'
end

# Seed Cities
cities_data = [
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

cities_data.each do |city_name|
  city = City.find_or_create_by!(name: city_name)

  # Seed a place for each city
  image_url = "https://example.com/#{city_name.parameterize}"
  place_name = "Hotel in #{city_name}"
  
  Place.find_or_create_by!(name: place_name, city: city) do |place|
    place.user = user
    place.image_url = image_url
    place.description = "Description of #{place_name}"
  end
end

puts 'Seeds created successfully!'
