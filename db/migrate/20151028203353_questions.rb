class Questions < ActiveRecord::Migration
  def change
    create_table "questions" do |t|
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
  end
end
