class Cities < ActiveRecord::Migration
  def change
    create_table "cities" do |t|
      t.string   "name"
      t.string   "lat_long"
      t.integer  "prov_id"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
