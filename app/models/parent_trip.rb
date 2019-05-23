class ParentTrip < ApplicationRecord
  belongs_to :user
  has_one :matched_trip
end
