class ChangeScoreFormatInUserRecommendations < ActiveRecord::Migration
  def up
    change_column :user_recommendations, :score, :string
  end

  def down
    change_column :user_recommendations, :score, :integer
  end
end
