import graphlab as gl
import os.path

path = os.path.dirname(os.path.abspath(__file__))
data = gl.SFrame.read_csv(os.path.join(path, "slim_response_data.csv"))

m = gl.recommender.factorization_recommender.create(data, user_id='user_id', item_id='place_id', target='response', user_data=None, item_data=None, num_factors=2, regularization=1e-08, linear_regularization=1e-10, side_data_factorization=True, nmf=False, binary_target=False, max_iterations=50, sgd_step_size=0, random_seed=0, solver='auto', verbose=True)

recs = m.recommend()

print recs

