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

ActiveRecord::Schema.define(version: 20160217203719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "member_contacts", force: :cascade do |t|
    t.string   "address1",       null: false
    t.string   "postal_code",    null: false
    t.string   "email",          null: false
    t.string   "cell_number"
    t.float    "latitude",       null: false
    t.float    "longitude",      null: false
    t.string   "avatar"
    t.integer  "typ_country_id"
    t.integer  "typ_region_id"
    t.integer  "member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "member_contacts_members", force: :cascade do |t|
    t.integer  "member_id",         null: false
    t.integer  "member_contact_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true, using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "typ_countries", force: :cascade do |t|
    t.string   "country"
    t.string   "postal_code"
    t.string   "geonameid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "typ_regions", force: :cascade do |t|
    t.string   "name"
    t.string   "timezone"
    t.integer  "typ_country_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
