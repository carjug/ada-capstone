class Answer < ActiveRecord::Base
  # Associations
  belongs_to :question
  belongs_to :culture
end
