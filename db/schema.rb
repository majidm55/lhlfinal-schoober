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

ActiveRecord::Schema.define(version: 2019_05_23_165004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "driver_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matched_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_reserved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parent_trips", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.date "trip_date"
    t.string "time_slot"
    t.integer "spots_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

end
