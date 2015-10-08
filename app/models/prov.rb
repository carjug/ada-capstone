class Prov < ActiveRecord::Base
  # Associations
  has_many :cities
  has_many :places, :through => :cities
  belongs_to :country

  # Validations
  validates :name, presence: true
  validates :country_id, presence: true,
            numericality: { only_integer: true }
end
