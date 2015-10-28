class PlaceTypes < ActiveRecord::Migration
  def change
    create_table "place_types" do |t|
      t.string   "description"

      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
  end
  end
end
