class AddUserIdToMatchedTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :matched_trips, :user_id, :integer
  end
end
