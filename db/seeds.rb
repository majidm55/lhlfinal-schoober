# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## USERS


puts "Finding or Creating users ..."

MatchedTrip.destroy_all
DriverTrip.destroy_all
ParentTrip.destroy_all
User.destroy_all
    
20.times do
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    fullname = "#{firstname}_#{lastname}"
    User.create!({
        first_name:  firstname,
        last_name:  lastname,
        email:  Faker::Internet.free_email(fullname),
        phone:  Faker::PhoneNumber.cell_phone,
        driver: true,
        user_pic: Faker::Avatar.image,
        password: '123456'
    })
end


# for i in 1..User.count
#     userid = i
#     "user#{i}" = User.find_by id: userid
#     puts "user#{i}"
# end

user1 = User.first
user2 = User.second
user3 = User.third
user4 = User.fourth
user5 = User.fifth
user6 = User.last


puts "Re-creating Driver Trips"

user1.driver_trips.create!({
    start_point: "5 MacLennan Ave, Toronto, ON",
    end_point:  "220 Lonsdale Rd, Toronto, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 3  
})

user2.driver_trips.create!({
    start_point: "23 Errington Ave, Toronto, ON",
    end_point:  "220 Lonsdale Rd, Toronto, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 4
})

user3.driver_trips.create!({
    start_point: "64 Garfield Ave, Toronto, ON",
    end_point:  "220 Lonsdale Rd, Toronto, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 3
})


user4.driver_trips.create!({
    start_point: "222 Douglas Drive, Toronto, ON",
    end_point:  "371 Bloor St W, Toronto, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 2
})


user5.driver_trips.create!({
    start_point: "216 Glen Road, Toronto, ON",
    end_point:  "371 Bloor St W, Toronto, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 4
})

user6.driver_trips.create!({
    start_point: "6 Governors Road, East York, ON",
    end_point: "371 Bloor St W, Toronto, ON",
    trip_date: Date.today,
    time_slot: "07:00 AM - 08:00 AM",
    spots_available: 2
})



puts "Re-creating Reviews"


user1.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user1.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user1.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user1.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

user2.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user2.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user2.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user2.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

user3.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user3.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user3.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user3.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

user4.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user4.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user4.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user4.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

user5.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user5.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user5.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user5.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

user6.reviews.create!({
    rating: 5,
    comment: "Wonderful"
})

user6.reviews.create!({
    rating: 4,
    comment: "Great trip"
})

user6.reviews.create!({
    rating: 5,
    comment: "Excellent"
})

user6.reviews.create!({
    rating: 5,
    comment: "Would like to book a trip again"
})

puts "DONE!"
