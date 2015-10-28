class Responses < ActiveRecord::Migration
  def change
    create_table "responses" do |t|
      t.string   "response"
      t.integer  "question_id"
      t.integer  "user_id"
      t.integer  "place_id"

      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
  end
  end
end
