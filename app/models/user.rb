require 'csv'

class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :responses
  has_many :user_recommendations

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true, on: :create

  def self.create_user_recommendations
    UserRecommendation.delete_all
    CSV.foreach("#{Rails.root}/lib/recommender/new_csv_file.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
      user_rec = UserRecommendation.new(row.to_hash)
      place = Place.find(user_rec.place_id)
      user_rec.city_id = place.city_id
      user_rec.place_name = place.name
      user_rec.save!
    end
  end

end

