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

ActiveRecord::Schema.define(version: 20151018221209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_places", id: false, force: :cascade do |t|
    t.integer "place_id",    null: false
    t.integer "category_id", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "prov_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "lat_long"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "cultures", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "type"
    t.string   "axis1"
    t.string   "axis2"
    t.string   "axis3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "place_type_id"
    t.integer  "culture_id"
  end

  create_table "provs", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "abbreviation"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "overall"
    t.integer  "rating1"
    t.integer  "rating2"
    t.integer  "rating3"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "culture_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

end
