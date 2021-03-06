require 'csv'

class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :responses
  has_many :user_recommendations

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true, on: :create

  # Scopes
  scope :recs_by_user_city, -> (user, city) {
    user.user_recommendations.joins(:place).where('place.city_id = ?', city.id)
  }


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

  def self.create_user_recs_from_s3
    UserRecommendation.delete_all

    s3 = AWS::S3.new
    File.open("#{Rails.root}/lib/new_user_recs.csv", 'wb') do |f|
      f.write(s3.buckets['niche-travel'].objects['new_user_recs.csv'].read)
    end

    CSV.foreach("#{Rails.root}/lib/new_user_recs.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
      user_rec = UserRecommendation.new(row.to_hash)
      place = Place.find(user_rec.place_id)
      user_rec.city_id = place.city_id
      user_rec.place_name = place.name
      user_rec.save!
    end
  end

end

