class Category < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :places
end