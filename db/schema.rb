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

ActiveRecord::Schema.define(version: 20180123024138) do

  create_table "bookings", force: :cascade do |t|
    t.integer "ticket_number"
    t.integer "booking_number"
    t.datetime "timestamp"
    t.integer "price"
    t.string "product_type"
    t.string "selling_point"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spectator_id"
    t.index ["spectator_id"], name: "index_bookings_on_spectator_id"
    t.index ["venue_id"], name: "index_bookings_on_venue_id"
  end

  create_table "spectacles", force: :cascade do |t|
    t.integer "key"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spectators", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "adress"
    t.integer "zip_code"
    t.string "country"
    t.integer "age"
    t.integer "sexe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer "key"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "spectacle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spectacle_id"], name: "index_venues_on_spectacle_id"
  end

end
