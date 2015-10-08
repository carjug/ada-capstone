class Category < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :places

  # Validations
  validates :category, presence: true
end
