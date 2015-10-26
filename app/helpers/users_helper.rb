module UsersHelper
  def place_rating(user)
    place = user.responses.find_by("place_id = ?", self.id)
    place.response
  end
end
