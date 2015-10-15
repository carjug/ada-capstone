class City < ActiveRecord::Base
  # Associations
  has_many :places
  belongs_to :prov

  # Validations
  validates :name, presence: true,
            uniqueness: true
  validates :prov_id, presence: true,
            numericality: { only_integer: true }

end
