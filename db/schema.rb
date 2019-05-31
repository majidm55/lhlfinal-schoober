# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_31_003029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "driver_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_available"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_driver_trips_on_user_id"
  end

  create_table "matched_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_reserved"
    t.bigint "parent_trip_id"
    t.bigint "driver_trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["driver_trip_id"], name: "index_matched_trips_on_driver_trip_id"
    t.index ["parent_trip_id"], name: "index_matched_trips_on_parent_trip_id"
  end

  create_table "parent_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_required"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parent_trips_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.boolean "driver"
    t.string "user_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  add_foreign_key "driver_trips", "users"
  add_foreign_key "matched_trips", "driver_trips"
  add_foreign_key "matched_trips", "parent_trips"
  add_foreign_key "parent_trips", "users"
  add_foreign_key "reviews", "users"
end
