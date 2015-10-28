class Countries < ActiveRecord::Migration
  def change
    create_table "countries" do |t|
      t.string   "name"
      t.string   "code"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
  end
  end
end
