class CreateUserRecommendations < ActiveRecord::Migration
  def change
    create_table :user_recommendations do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :score
      t.integer :rank

      t.timestamps null: false
    end
  end
end
