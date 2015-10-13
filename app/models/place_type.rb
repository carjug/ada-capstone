class PlaceType < ActiveRecord::Base
  # Associations
  has_many :places
end
