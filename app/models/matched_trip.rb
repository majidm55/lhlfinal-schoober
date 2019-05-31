class MatchedTrip < ApplicationRecord
  has_one :parent_trip
  belongs_to :driver_trip
end
