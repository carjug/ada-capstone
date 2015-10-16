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

  def top_categories_per_place
    top_cats = {}

    self.categories.each do |cat|
      name = cat.category
      if top_cats.has_key?(name)
        top_cats[name] += 1
      else
        top_cats.store(name, 1)
      end
    end

    ary = top_cats.to_a
    ary.sort! { |x,y| y[1] <=> x[1] }

    return ary.take(3)
  end

  def self.top_places_by_culture_and_city(city, culture_id)
    returned_places = []
    places = self.top_places_per_city(city)

    places.each do |place|
      if place.culture_id == culture_id
        returned_places << place
      end
    end
  end

end
