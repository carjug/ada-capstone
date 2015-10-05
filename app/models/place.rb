class Place < ActiveRecord::Base
  # Associations
  belongs_to :city
  has_and_belongs_to_many :categories
end
