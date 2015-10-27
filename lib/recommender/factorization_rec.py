import graphlab as gl
import os.path

path = os.path.dirname(os.path.abspath(__file__))
data = gl.SFrame.read_csv(os.path.join(path, "slim_response_data.csv"))

