class Place < ActiveRecord::Base
  # Associations
  belongs_to :city
  belongs_to :prov, through: :city
  has_and_belongs_to_many :categories
end
