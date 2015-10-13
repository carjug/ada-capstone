class Axis < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :place_types
end
