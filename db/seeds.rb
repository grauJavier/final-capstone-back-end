# Seed Users
users_data = [
  { email: 'graujavier@gmail.com', username: 'Javier', password: '123456' },
  { email: 'sanchezmanuel@gmail.com', username: 'Manuel', password: '123456' },
  { email: 'vasquezanthony@gmail.com', username: 'Anthony', password: '123456' },
]

users = users_data.map do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |u|
    u.username = user_data[:username]
    u.password = user_data[:password]
  end
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

# Data Fetching Photos from Unsplash
base_url = 'https://api.unsplash.com/search/photos?query='
access_key = 'D5vfOwznTRQV6XfGv_rMQ2fsxPmwB41nSNimzUNUUJE'
query = 'hotel room'.parameterize
orientation = 'squarish'

response = HTTParty.get(base_url, query: { query: query, orientation: orientation }, headers: { 'Authorization' => "Client-ID #{access_key}" })

# Seed a place for each city
cities_data.each do |city_name|
  city = City.find_or_create_by!(name: city_name)
  image_url = response['results'].sample['urls']['regular']
  place_name = "Hotel in #{city_name}"
  
  Place.find_or_create_by!(name: place_name, city: city) do |place|
    place.user = users.sample
    place.image_url = image_url
    place.description = "Description of #{place_name}"
  end
end

# Seed a details for each place
Place.all.each do |place|
  Detail.find_or_create_by!(place: place) do |detail|
    detail.place = place
    detail.place_type = ["Room", "Entire Place"].sample
    detail.bedrooms = rand(1..5)
    detail.beds = rand(1..10)
    detail.bathrooms = rand(1..5)
    detail.property_type = ["Apartment", "House", "Guest House", "Hotel"].sample
    detail.price = rand(500..5000)
  end
end

puts 'Seeds created successfully!'
