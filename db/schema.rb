# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_10_203806) do

  create_table "addresses", force: :cascade do |t|
    t.string "number", null: false
    t.string "street", null: false
    t.string "city", default: "Arlington", null: false
    t.string "state", default: "TX", null: false
    t.string "zip", default: "76016", null: false
    t.decimal "latitude", precision: 9, scale: 6
    t.decimal "longitude", precision: 9, scale: 6
    t.string "image_link"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "addr", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "houses", force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "linked_lot_id"
    t.boolean "flag", default: false
    t.boolean "rental", default: false
    t.boolean "listed", default: false
    t.string "status", default: "occupied"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "occupancies", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "person_id", null: false
    t.string "relation"
    t.string "status", default: "Other"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "house_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "nickname"
    t.string "first", null: false
    t.string "middle"
    t.string "last", null: false
    t.string "suffix"
    t.string "honorific"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_addresses", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "address_id", null: false
    t.string "locn"
    t.string "preferred", default: "No"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_emails", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "email_id", null: false
    t.string "locn"
    t.string "preferred", default: "No"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_phones", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "phone_id", null: false
    t.string "locn"
    t.string "preferred", default: "No"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "cc", default: "1"
    t.string "area", null: false
    t.string "prefix", null: false
    t.string "number", null: false
    t.text "txt_msg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
