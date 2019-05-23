class User < ApplicationRecord
    has_many :driver_trips
    has_many :parent_trips
    has_many :reviews
end
