class AddPlaceNameToUserRecommendations < ActiveRecord::Migration
  def change
    add_column :user_recommendations, :place_name, :string
  end
end
