class Country < ActiveRecord::Base
  # Association
  has_many :provs
  has_many :cities, through: :provs
end
