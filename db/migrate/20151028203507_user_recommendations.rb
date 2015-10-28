class UserRecommendations < ActiveRecord::Migration
  def change
    create_table "user_recommendations" do |t|
      t.integer  "rank"
      t.string   "place_name"
      t.string   "score"
      t.integer  "user_id"
      t.integer  "city_id"
      t.integer  "place_id"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
  end
  end
end
