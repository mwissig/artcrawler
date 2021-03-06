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

ActiveRecord::Schema.define(version: 2018_10_01_012127) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.text "description"
    t.string "website"
    t.boolean "private"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "location_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "loc_type"
    t.string "name"
    t.integer "event_id"
    t.integer "user_id"
    t.text "description"
    t.string "address"
    t.string "suite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved"
  end

  create_table "loctimes", force: :cascade do |t|
    t.integer "location_id"
    t.boolean "sunday"
    t.time "sun_open"
    t.time "sun_close"
    t.boolean "monday"
    t.time "mon_open"
    t.time "mon_close"
    t.boolean "tuesday"
    t.time "tues_open"
    t.time "tues_close"
    t.boolean "wednesday"
    t.time "weds_open"
    t.time "weds_close"
    t.boolean "thursday"
    t.time "thurs_open"
    t.time "thurs_close"
    t.boolean "friday"
    t.time "fri_open"
    t.time "fri_close"
    t.boolean "saturday"
    t.time "sat_open"
    t.time "sat_close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "primary_medium"
    t.string "secondary_medium"
    t.string "portfolio"
    t.string "instagram"
    t.text "statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "primary_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
  end

  create_table "waypoints", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

end
