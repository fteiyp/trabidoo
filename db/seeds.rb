# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Trabi.destroy_all
Booking.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    first_name:     'Guy',
    last_name:      'Fieri',
    email:          'guyfieri@example.com',
    password:       'food',
    phone_number:   '6173653787',
    street_address: '34 Something Ave.',
    city_address:   'New York',
    zip_address:    '12345',
    country_address: 'United States',
    photo:           'https://cdn.vox-cdn.com/thumbor/dal2kKDXXU-BmDVACTLOS47UPas=/0x0:2160x3000/1200x800/filters:focal(982x778:1326x1122)/cdn.vox-cdn.com/uploads/chorus_image/image/59023747/82665331.jpg.0.jpg',
  },
  {
    first_name:     'Armin',
    last_name:      'Van Buuren',
    email:          'techno@example.com',
    password:       'idk123',
    phone_number:   '1234567890',
    street_address: '123 Rainbow Rd.',
    city_address:   'Amsterdam',
    zip_address:    '32145',
    country_address: 'The Netherlands',
    photo:          ''
  },
  {
    first_name:     'Reid',
    last_name:      'Shea',
    email:          'reidemail@example.com',
    password:       'mypassword',
    phone_number:   '1234567890',
    street_address: '53 Doow St.',
    city_address:   'Cambridge',
    zip_address:    '10405',
    country_address: 'United States',
    photo:          ''
  },
  {
    first_name:     'Bill',
    last_name:      'Clinton',
    email:          'billy@example.com',
    password:       'monica',
    phone_number:   '6173653787',
    street_address: '22 Washington Ave.',
    city_address:   'Washinton',
    zip_address:    '12345',
    country_address: 'United States',
    photo:           '',
  }

]
User.create(users_attributes)

puts 'Creating trabis...'
trabis_attributes = [
  {
    title: 'Trabant GT',
    color: 'gray',
    year: '1968',
    location: '',
    description: 'An automobile which was produced from 1957 to 1990 by former East German car manufacturer VEB Sachsenring Automobilwerke Zwickau. It is often seen as symbolic of the former East Germany and the collapse of the Eastern Bloc in general.',
    user_id: 1
  },
  {
    title: 'Red Storm',
    color: 'red',
    year: '1972',
    location: '',
    description: 'My father gave this to me many years ago. He recieved it as a gift for his good service as a member of the Stasi :)',
    user_id: 2
  }
]
Trabi.create(trabis_attributes)

puts 'Creating bookings...'
bookings_attributes = [
  {
    start_date: DateTime.new(2019,11,3,12,0,0),
    end_date: DateTime.new(2019,11,5,12,0,0),
    created_at: DateTime.new(2019,11,1,12,0,0),
    updated_at: nil,
    rating_review: '5',
    content_review: 'Amazing time. Wow. Fantastic.',
    user_id: '3',
    trabi_id: '2'
  }
]
Booking.create!(bookings_attributes)

puts 'Finished!'
