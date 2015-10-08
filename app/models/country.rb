class Country < ActiveRecord::Base
  # Associations
  has_many :provs
  has_many :cities, :through => :provs

  # Validations
  validates :name, presence: true
end
