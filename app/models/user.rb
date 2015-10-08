class User < ActiveRecord::Base
  has_secure_password

  # Associations
  belongs_to :culture

  # Validations
  validates :username, presence: true
  validates :culture_id, presence: true,
            numericality: { only_integer: true }
end
