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

ActiveRecord::Schema.define(version: 2023_03_04_220100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "country"
    t.string "recipe_link"
    t.string "recipe_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_favorites", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "favorites_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorites_id"], name: "index_users_favorites_on_favorites_id"
    t.index ["users_id"], name: "index_users_favorites_on_users_id"
  end

  add_foreign_key "users_favorites", "favorites", column: "favorites_id"
  add_foreign_key "users_favorites", "users", column: "users_id"
end
