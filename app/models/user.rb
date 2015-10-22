class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :responses
  has_many :user_recommendations

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true, on: :create

  end
end

