class Question < ActiveRecord::Base
  # Associations
  has_many :answers

  # Validations
  validates :question, presence: true
end
