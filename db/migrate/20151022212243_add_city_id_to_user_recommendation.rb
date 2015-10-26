class AddCityIdToUserRecommendation < ActiveRecord::Migration
  def change
    add_column :user_recommendations, :city_id, :integer
  end
end
