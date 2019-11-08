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

ActiveRecord::Schema.define(version: 2019_11_08_095624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "beast_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beast_id"], name: "index_availabilities_on_beast_id"
  end

  create_table "beasts", force: :cascade do |t|
    t.bigint "sucker_id"
    t.bigint "type_id"
    t.string "name"
    t.string "region"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "price"
    t.index ["sucker_id"], name: "index_beasts_on_sucker_id"
    t.index ["type_id"], name: "index_beasts_on_type_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "sucker_id"
    t.bigint "beast_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beast_id"], name: "index_bookings_on_beast_id"
    t.index ["sucker_id"], name: "index_bookings_on_sucker_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "beast_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beast_id"], name: "index_photos_on_beast_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id"
    t.text "sucker_content"
    t.integer "sucker_rating"
    t.text "beast_content"
    t.integer "beast_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "suckers", force: :cascade do |t|
    t.string "user_name"
    t.string "name"
    t.string "phone"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_suckers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_suckers_on_reset_password_token", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities", "beasts"
  add_foreign_key "beasts", "suckers"
  add_foreign_key "beasts", "types"
  add_foreign_key "bookings", "beasts"
  add_foreign_key "bookings", "suckers"
  add_foreign_key "photos", "beasts"
  add_foreign_key "reviews", "bookings"
end
