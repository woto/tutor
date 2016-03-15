# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160315151233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.float    "lat"
    t.float    "lng"
    t.integer  "location_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "undergraduate_school"
    t.string   "graduate_school"
    t.integer  "school_year"
    t.float    "teach_fee"
    t.float    "learn_fee"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "avatar"
    t.text     "about"
    t.string   "phone"
    t.string   "skype"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_disciplines", force: :cascade do |t|
    t.integer  "discipline_id"
    t.integer  "user_id"
    t.integer  "discipline_type"
    t.string   "discipline_areas"
    t.integer  "discipline_year"
    t.float    "discipline_grade"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users_disciplines", ["discipline_id"], name: "index_users_disciplines_on_discipline_id", using: :btree
  add_index "users_disciplines", ["user_id"], name: "index_users_disciplines_on_user_id", using: :btree

  add_foreign_key "locations", "users"
  add_foreign_key "users_disciplines", "disciplines"
  add_foreign_key "users_disciplines", "users"
end
