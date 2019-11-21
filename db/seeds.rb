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
    password:       'password',
    phone_number:   '6173653787',
    street_address: '172 Norfolk Street',
    city_address:   'New York',
    zip_address:    'NY 10002',
    country_address: 'United States',
    photo:           'https://cdn.vox-cdn.com/thumbor/dal2kKDXXU-BmDVACTLOS47UPas=/0x0:2160x3000/1200x800/filters:focal(982x778:1326x1122)/cdn.vox-cdn.com/uploads/chorus_image/image/59023747/82665331.jpg.0.jpg',
  },
  {
    first_name:     'Bill',
    last_name:      'Clinton',
    email:          'billclinton@example.com',
    password:       'password',
    phone_number:   '6173653787',
    street_address: '1700 New Jersey Ave NW',
    city_address:   'Washington',
    zip_address:    'DC 20001',
    country_address: 'United States',
    photo:           'https://pbs.twimg.com/profile_images/1187747845664923648/i_zlFpOX_400x400.jpg',
  },
  {
    first_name:     'Terry',
    last_name:      'Crews',
    email:          'terrycrews@example.com',
    password:       'password',
    phone_number:   '1234567890',
    street_address: '34 Kirkland Street',
    city_address:   'Cambridge',
    zip_address:    'MA 02138',
    country_address: 'United States',
    photo:          'https://www.biography.com/.image/t_share/MTE5NDg0MDYwNjkzMjY3OTgz/terry-crews-headshot-600x600jpg.jpg'
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
  }
]
User.create!(users_attributes)

puts 'Creating trabis...'
trabis_attributes = [


  ### ---------- for Berlin search ---------

  {
    title: 'Trabant 601, 3rd Generation, 4-Speed Manual',
    color: 'Tan',
    year: '1968',
    description: 'I bought this last year at an auction and have been fixing it up since this winter. I\'m a mechanic with a lot of cars but this is by far my favorite! You are welcome to rent my Trabi for an afternoon or a day or two.',
    address: 'Prenzlauer Allee 6, 10405, Berlin',
    user_id: 1
  },
  {
    title: 'Classic Trabant P50, made by VEB Sachsenring',
    color: 'Tan',
    year: '1972',
    description: 'My father gave this to me many years ago. I often take it on rides around the city, and am an active member of the Berlin Trabant community. Always happy to rent it out for a few days to someone who would like the experience this classic vehicle!',
    address: 'Niederkirchnerstrasse 7, 10963 Berlin',
    user_id: 2
  },
  {
    title: 'Yellow Trabant in excellent condition, ready to ride',
    color: 'Yellow',
    year: '1978',
    description: 'We purchased this car from a man in Arkansas, or Tennessee, or Kentucky? I can’t remember, that was 10 years ago! The car performes flawlessly and I love it!!',
    address: 'Oranienstraße 190, 10999 Berlin',
    user_id: 3
  },

  ### ---------- for Cambridge MA search ---------

  {
    title: '3rd Generation Trabant 707, Manual 5-Speed',
    color: 'Tan',
    year: '1968',
    description: 'I bought this last year at an auction and have been fixing it up since this winter. I\'m a mechanic with a lot of cars but this is by far my favorite! You are welcome to rent my Trabi for an afternoon or a day or two.',
    address: '172 Norfolk Street, New York, NY 10002, United States',
    user_id: 1
  },
  {
    title: 'Tan Vintage Trabant, Soviet Era Vehicle',
    color: 'Tan',
    year: '1976',
    description: 'I often take this on rides around the city, and am an active member of the Berlin Trabant community. My brother gave it to me many years ago. Always happy to rent it out for a few days to someone who would like the experience this classic vehicle!',
    address: '1700 New Jersey Ave NW, Washington, DC 20001, United States',
    user_id: 2
  },
  {
    title: 'One of 50 Original Trabant P50, VEB Sachsenring Edition',
    color: 'Green',
    year: '1971',
    description: 'We purchased this car from a man in Arkansas, or Tennessee, or Kentucky? I can’t remember, that was 10 years ago! The car performes flawlessly and I love it!!',
    address: '34 Kirkland Street, Cambridge, MA 02138, United States',
    user_id: 3
  }
]
Trabi.create!(trabis_attributes)

puts 'Creating bookings...'
bookings_attributes = [
  {
    start_date: DateTime.new(2019,11,3,12,0,0),
    end_date: DateTime.new(2019,11,5,12,0,0),
    rating_review: '0',
    content_review: 'Very bad! Only for real fans!',
    user_id: '1',
    trabi_id: '2',
  },
  {
    start_date: DateTime.new(2019,11,4,13,22,0),
    end_date: DateTime.new(2019,11,4,13,22,0),
    rating_review: nil,
    content_review: nil,
    user_id: '2',
    trabi_id: '1',
  },
  {
    start_date: DateTime.new(2018,1,5,8,11,0),
    end_date: DateTime.new(2018,1,10,17,01,0),
    rating_review: '4',
    content_review: 'Amazing time. Wow. Fantastic.',
    user_id: '3',
    trabi_id: '2',
  },
  {
    start_date: DateTime.new(2019,10,7,11,56,0),
    end_date: DateTime.new(2019,10,9,15,43,0),
    rating_review: 3,
    content_review: 'Quite good.',
    user_id: '3',
    trabi_id: '1'
  }
]
Booking.create!(bookings_attributes)

puts 'Finished!'
