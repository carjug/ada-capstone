class Place < ActiveRecord::Base
  # Associations
  belongs_to :city
  belongs_to :place_type
  has_many :ratings
  has_and_belongs_to_many :categories

  # Validations
  validates :name, presence: true
  # validates :place_type_id, presence: true
  validates :city_id, presence: true,
            numericality: { only_integer: true }
  validates :categories, presence: true,
            length: { minimum: 3 }

  # Scopes
  scope :top_places, -> {
    joins(:ratings).where('ratings.overall >= ?', 4)
  }

  scope :top_places_per_city, -> (city) {
    top_places.where('city_id = ?', city.id)
  }

  scope :top_places_per_user, -> (user) {
    top_places.where('ratings.user_id = ?', user.id)
  }


  # Methods
end
