class CreatePlaceTypes < ActiveRecord::Migration
  def change
    create_table :place_types do |t|
      t.string :type
      t.string :axis1
      t.string :axis2
      t.string :axis3

      t.timestamps null: false
    end
  end
end
