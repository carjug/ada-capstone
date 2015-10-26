class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to :question

  validates_uniqueness_of :place_id, scope: :user_id
end
