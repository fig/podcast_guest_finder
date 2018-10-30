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

ActiveRecord::Schema.define(version: 2018_10_30_183203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plperl"
  enable_extension "plperlu"
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.string "name", null: false
    t.string "link"
    t.text "description"
    t.text "show_notes"
    t.string "published_at"
    t.string "audio_file_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id", "name"], name: "index_episodes_on_show_id_and_name", unique: true
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "xml_feed_url", null: false
    t.index ["name"], name: "index_shows_on_name", unique: true
    t.index ["xml_feed_url"], name: "index_shows_on_xml_feed_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "episodes", "shows"
end
