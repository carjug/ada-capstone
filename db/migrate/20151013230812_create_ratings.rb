class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :overall
      t.integer :rating1
      t.integer :rating2
      t.integer :rating3
      t.integer :user_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
