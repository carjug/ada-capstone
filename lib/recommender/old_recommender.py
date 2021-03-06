from scipy.stats.stats import pearsonr
import pandas as pandas
import numpy as np
from IPython import embed
import math
import os.path

path = os.path.dirname(os.path.abspath(__file__))
data = pandas.read_csv(os.path.join(path, "slim_response_data.csv"))

users = data.user_id.unique().tolist()
users =  sorted(users)
places = data.place_id.unique().tolist()
places = sorted(places)

temp = []
for u in users:
  user_places = data[data.user_id == u].place_id
  user_places = user_places.tolist()
  user_places.sort()
  temp.append(user_places)

print len(temp)
print len(users)

user_data_matrix = []
user_avg_ratings = []
user_ratings_by_place_matrix = []

# this wont work because the range of user_ids is unknown for any given set of users
for u in users:
  user_array = []
  user_in_places = temp[u-1]

  user_ratings = data[data.user_id == u].response
  user_ratings = user_ratings.tolist()
  # Need to do get a matrix where the columns are places, the rows are users
  # And the data are ratings of the places

  avg = sum(user_ratings)/float(len(user_ratings))
  avg = round(avg, 1)
  user_avg_ratings.append(avg)

  for p in places:
    try:
      user_in_places.index(p) # looks for the value p at any index in user_in_places
      user_array.append(p)
    except ValueError:
      user_array.append("nan")
  user_data_matrix.append(user_array)

print "User data matrix ", user_data_matrix
print "Length of user data matrix ", len(user_data_matrix)

print "User avg ratings ", user_avg_ratings

def get_place_reviews(place, common_reviewers):
  reviewer_places = (data.user_id.isin(common_reviewers)) & (data.place_id==place)
  reviews = data[reviewer_places].sort_values(by='user_id')
  reviews = reviews[reviews.user_id.duplicated()==False]
  return reviews

place_data_matrix = []
common_reviews_matrix = []

for i in places:
  place_array = []
  place_reviewers = []
  place_1_id = i
  for k in places:
    place_2_id = k

    place_1_reviewers = data[data.place_id == place_1_id].user_id
    place_2_reviewers = data[data.place_id == place_2_id].user_id
    common_reviewers = set(place_1_reviewers).intersection(place_2_reviewers)

    place_1_reviews = get_place_reviews(place_1_id, common_reviewers) # method call
    place_2_reviews = get_place_reviews(place_2_id, common_reviewers) # method call

    # if correlation is close to -1 the two places are negatively correlated
    # if correlation is close to +1 the two places are positively correlated

    correlation_coefficient = pearsonr(place_1_reviews.response, place_2_reviews.response)[0]

    # the users that have reviewed both of the places in question
    # print "Common reviewer IDs ", common_reviewers, "place 1 =", place_1_id, "place 2 =", place_2_id
    # print "Number of common reviewers = ", len(common_reviewers)
    place_reviewers.append(len(common_reviewers))
    if math.isnan(correlation_coefficient) == True:
      place_array.append(0)
    else:
      place_array.append(correlation_coefficient)

  common_reviews_matrix.append(place_reviewers)
  place_data_matrix.append(place_array)

print "Place data matrix ", place_data_matrix
print "Number of common reviews ", common_reviews_matrix
