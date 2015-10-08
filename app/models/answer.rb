class Answer < ActiveRecord::Base
  # Associations
  belongs_to :question

  # Validations
  validates :answer, presence: true
  validates :question_id, presence: true,
            numericality: { only_integer: true }
end
