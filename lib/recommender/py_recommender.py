import graphlab as gl
import os
import boto
import os.path
from os.path import join, dirname
from boto.s3.connection import S3Connection
from boto.s3.key import Key
from dotenv import load_dotenv

# this is for local reading
# path = os.path.dirname(os.path.abspath(__file__))
# data = gl.SFrame.read_csv(os.path.join(path, "slim_response_data.csv"))
# m = gl.recommender.item_similarity_recommender.create(data, user_id='user_id', item_id='place_id', target="response", user_data=None, item_data=None, nearest_items=None, similarity_type='pearson', training_method='auto', threshold=0.001, only_top_k=100, random_seed=0, verbose=True)
# recs = m.recommend()
# print recs

# # this is for local export
# recs.export_csv(os.path.join(path, "new_csv_file.csv"),delimiter=",",line_terminator='\n', header=True)

# for accessing AWS keys in .env file
dotenv_path = join(dirname(__file__),'.env')
load_dotenv(dotenv_path)

access_key = os.getenv("AWS_ACCESS_KEY_ID")
secret_key = os.getenv("AWS_SECRET_ACCESS_KEY")

# # Read S3 bucket file content
conn = S3Connection(access_key, secret_key)
bucket = conn.get_bucket('niche-travel')

user_recs = bucket.get_key('user_recs.csv')
user_recs = user_recs.generate_url(120, method="GET")

data = gl.SFrame.read_csv(user_recs)
print data

m = gl.recommender.item_similarity_recommender.create(data, user_id='user_id', item_id='place_id', target="response", user_data=None, item_data=None, nearest_items=None, similarity_type='pearson', training_method='auto', threshold=0.001, only_top_k=100, random_seed=0, verbose=True)
recs = m.recommend()

# Write to different S3 bucket
k = Key(bucket)
k.new_key = 'new_user_recs.csv'
k = k.generate_url(30, method="POST")

recs.save("s3://niche-travel/new_user_recs.csv", format="csv")


