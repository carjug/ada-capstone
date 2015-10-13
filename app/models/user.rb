class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :ratings
  belongs_to :culture

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true, on: :create

  # Not sure where to put this in..
  # validates :culture_id, presence: true,
  #           numericality: { only_integer: true }
end
