class City < ActiveRecord::Base
  # Associations
  has_many :places
  belongs_to :prov
  belongs_to :country, through: :prov
end
