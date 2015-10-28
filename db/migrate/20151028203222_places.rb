class Places < ActiveRecord::Migration
  def change
    create_table "places" do |t|
      t.string   "name"
      t.string   "image"
      t.integer  "city_id"
      t.integer  "place_type_id"

      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
  end
  end
end
