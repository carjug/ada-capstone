require 'csv'
class Place < ActiveRecord::Base
  # Associations
  belongs_to :city
  belongs_to :place_type
  has_many :responses
  has_and_belongs_to_many :categories

  # Validations
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :city_id
  validates :city_id, presence: true,
            numericality: { only_integer: true }

  # Scopes
  scope :places_by_city, -> (city) {
    joins(:city).where('city_id = ?', city.id )
  }

  scope :places_user_has_rated, -> (user) {
    joins(:responses).where('user_id = ?', user.id)
  }


  # Methods

  def place_rating(user)
    place = user.responses.find_by("place_id = ?", self.id)
    place.response
  end

  def response_id(user)
    r = user.responses.find_by("place_id = ?", self.id)
    r.id
  end

  def self.write_csv
    collection = self.all
    header = ["response","question","question_id","place_id","user_id","cat_or_ord"]
    file = "#{Rails.root}/lib/recommender/slim_response_data.csv"

    CSV.open(file, "w") do |writer|
      writer << header
      collection.each do |place|
        if place.id != 1
          u_responses = place.responses
          u_responses.each do |r|
            q = Question.find(r.question_id)
            if q.question == "Overall"
              writer << [r.response, q.question, r.question_id, r.place_id, r.user_id, q.cat_or_ord]
            end
          end
        end
      end
    end
  end

  def self.write_S3
    file = "#{Rails.root}/lib/recommender/slim_response_data.csv"
    s3 = AWS::S3.new
    bucket = s3.buckets['niche-travel']
    obj = bucket.objects['user_recs']

    obj.write(Pathname.new(file))
  end

end
