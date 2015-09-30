class Prov < ActiveRecord::Base
  # Associations
  has_many :cities
  has_many :places, through: :cities
  belongs_to :country
end
