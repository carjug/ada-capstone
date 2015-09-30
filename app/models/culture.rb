class Culture < ActiveRecord::Base
  # Associations
  has_many :users
  has_many :answers
end
