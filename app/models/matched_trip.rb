class MatchedTrip < ApplicationRecord
    has_one :parent_trip
    has_one :driver_trip
end
