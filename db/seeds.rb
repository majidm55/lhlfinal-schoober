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


puts "Re-creating Parent Trips"


user1.parent_trips.create!({
    start_point: "70 Whitehall Road, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})

user1.parent_trips.create!({
    start_point: "131 Bloor St W #426, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "03:00 PM - 04:00 PM",
    spots_required: 1
})

user1.parent_trips.create!({
    start_point: "70 Whitehall Road, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  "2019-06-07",
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})


user2.parent_trips.create!({
    start_point: "39 St Andrews Gardens, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})

user2.parent_trips.create!({
    start_point: "131 Bloor St W #426, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "03:00 PM - 04:00 PM",
    spots_required: 1
})

user2.parent_trips.create!({
    start_point: "39 St Andrews Gardens, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  "2019-06-07",
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})


user3.parent_trips.create!({
    start_point: "188 Roxborough Dr, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})

user3.parent_trips.create!({
    start_point: "131 Bloor St W #426, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "03:00 PM - 04:00 PM",
    spots_required: 1
})

user3.parent_trips.create!({
    start_point: "188 Roxborough Dr, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_required: 1
})


puts "Re-creating Driver Trips"

user4.driver_trips.create!({
    start_point: "222 Douglas Drive, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 1
})

user4.driver_trips.create!({
    start_point: "222 Douglas Drive, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "03:00 PM - 04:00 PM",
    spots_available: 1
})

user5.driver_trips.create!({
    start_point: "216 Glen Road, Toronto, ON",
    end_point:  "490 York Mills Rd, North York, ON",
    trip_date:  Date.today,
    time_slot:  "07:00 AM - 08:00 AM",
    spots_available: 1
})

user5.driver_trips.create!({
    start_point: "222 Douglas Drive, Toronto, ON",
    end_point: "490 York Mills Rd, North York, ON",
    trip_date: Date.today,
    time_slot: "03:00 PM - 04:00 PM",
    spots_available: 1
})

user6.driver_trips.create!({
    start_point: "6 Governors Road, East York, ON",
    end_point: "490 York Mills Rd, North York, ON",
    trip_date: Date.today,
    time_slot: "07:00 AM - 08:00 AM",
    spots_available: 1
})



puts "recreating matched trips"

# user6.driver_trips.

puts "DONE!"
