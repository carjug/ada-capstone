class Rating < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :place

  # Validations
  validates_presence_of :overall, :rating1, :rating2,
                        :rating3, :user_id, :place_id
end
