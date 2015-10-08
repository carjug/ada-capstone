class Place < ActiveRecord::Base
  # Associations
  belongs_to :city
  has_and_belongs_to_many :categories

  # Validations
  validates :name, presence: true
  validates :city_id, presence: true,
            numericality: { only_integer: true }

end
