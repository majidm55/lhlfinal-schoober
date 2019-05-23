class MatchedTrip < ApplicationRecord
  belongs_to :parent_trip
  belongs_to :driver_trip
end
