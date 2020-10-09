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

ActiveRecord::Schema.define(version: 2020_10_09_152928) do

  create_table "addresses", force: :cascade do |t|
    t.string "line1", null: false
    t.string "line2"
    t.string "city", default: "Arlington", null: false
    t.string "state", default: "TX", null: false
    t.string "zip", default: "76016", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "address"
    t.string "type"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "cc"
    t.string "area"
    t.string "prefix"
    t.string "number"
    t.string "type"
    t.text "txt_msg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
