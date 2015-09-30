class Question < ActiveRecord::Base
  # Associations
  has_many :answers
end
