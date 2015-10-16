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

  scope :users_by_culture, -> (culture_id) {
    where('culture.id = ?', culture_id)
  }

  scope :ratings_by_culture, -> (culture_id) {
    users_by_culture(culture_id).where('ratings.overall >= ?', 4)
  }

  # Methods
  def self.culture
    culture = Culture.find(self.culture_id)
    culture.title
  end

end
