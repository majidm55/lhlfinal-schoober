class CreateMatchedTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :matched_trips do |t|
      t.string :start_point
      t.string :end_point
      t.date :trip_date
      t.string :time_slot
      t.integer :spots_reserved

      t.timestamps
    end
  end
end
