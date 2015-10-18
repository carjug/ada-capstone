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
  # validates :categories, presence: true,
  #           length: { minimum: 3 }

  # Scopes
  scope :places_by_city, -> (city) {
    joins(:city).where('city_id = ?', city.id )
  }

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

  # want to refactor to a scope
  def most_common_top_culture
    top_cultures = {}
    self.ratings.each do |rating|
      if rating.overall >= 4
        user = User.find(rating.user_id)
        culture = Culture.find(user.culture_id)
        title = culture.title
        if top_cultures.has_key?(title)
          top_cultures[title] += 1
        else
          top_cultures.store(title, 1)
        end
      end
    end
    ary = top_cultures.to_a
    ary.sort! { |x, y| y[1] <=> x[1] }

    new_culture = Culture.find_by(title: ary[0][0])
    self.culture_id = new_culture.id
    self.save!
    return ary[0][0]
  end
end
