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

ActiveRecord::Schema.define(version: 20151028204427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_places", force: :cascade do |t|
    t.integer "category_id"
    t.integer "place_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "lat_long"
    t.integer  "prov_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "city_id"
    t.integer  "place_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "provs", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "option1"
    t.string   "option2"
    t.string   "option3"
    t.string   "option4"
    t.string   "option5"
    t.string   "cat_or_ord"
    t.integer  "place_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "responses", force: :cascade do |t|
    t.string   "response"
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_recommendations", force: :cascade do |t|
    t.integer  "rank"
    t.string   "place_name"
    t.string   "score"
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
