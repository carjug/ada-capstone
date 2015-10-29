import graphlab as gl
import os.path
from dotenv import load_dotenv

# for accessing AWS keys in .env file
dotenv_path = join(dirname(__file__), '.env')
load_dotenv(dotenv_path)
SECRET_KEY = os.environ.get("SECRET_KEY")

# this is for local reading
path = os.path.dirname(os.path.abspath(__file__))
data = gl.SFrame.read_csv(os.path.join(path, "slim_response_data.csv"))

# Read S3 bucket file content


m = gl.recommender.item_similarity_recommender.create(data, user_id='user_id', item_id='place_id', target="response", user_data=None, item_data=None, nearest_items=None, similarity_type='pearson', training_method='auto', threshold=0.001, only_top_k=100, random_seed=0, verbose=True)
recs = m.recommend()
print recs

# this is for local export
recs.export_csv(os.path.join(path, "new_csv_file.csv"),delimiter=",",line_terminator='\n', header=True)

# Write to different S3 bucket
