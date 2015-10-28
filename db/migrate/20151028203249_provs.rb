class Provs < ActiveRecord::Migration
  def change
    create_table "provs" do |t|
      t.string   "name"
      t.string   "abbreviation"
      t.integer  "country_id"

      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
  end
  end
end
