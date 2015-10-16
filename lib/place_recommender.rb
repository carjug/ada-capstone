class PlaceRecommender
  def initialize(user, collection)
    @user = user
    @collection = collection
  end

  def place_recommendation
    # the closer to 1 the more similar they are
    Jaccard.coeffecient(@user, @collection)
  end

  def user_recommendation
    # the closer to 1 the more similar they are
    Jaccard.coeffecient(@user, @collection)
  end
end
