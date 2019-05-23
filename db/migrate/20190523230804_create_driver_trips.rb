class CreateDriverTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_trips do |t|
      t.string :start_point
      t.string :end_point
      t.date :trip_date
      t.string :time_slot
      t.integer :spots_available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
