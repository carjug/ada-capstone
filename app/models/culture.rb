class Culture < ActiveRecord::Base
  # Associations
  has_many :users

  # Scopes

  # scope :top_culture_by_place, -> (place) {
  #   joins(:users).where('place.ratings.user_id')
  # }

  # def top_culture_by_place(place)
  #   self.users
  #   binding.pry
  # end
end
