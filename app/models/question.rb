class Question < ActiveRecord::Base
  # Association
  has_many :answers
end
