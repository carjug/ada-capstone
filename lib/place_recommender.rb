class PlaceRecommender
  def initialize(user, collection)
    @user = user
    @collection = collection
  end

  def place_recommendation
    # the closer to 1 the more similar they are
    # the goal is to compare the user's highly rated places to all places in a given city
    # via their assigned categories
    Jaccard.coeffecient(@user, @collection)
  end

  def user_recommendation
    # the closer to 1 the more similar they are
    # the goal is to compare users to other users in their culture and recommend places
    # that those people have rated highly (may not need jaccard for this)
    Jaccard.coeffecient(@user, @collection)
  end
end
