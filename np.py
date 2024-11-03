import numpy as np

sample_list = [10, 20, 30, 40, 50, 60]

sample_numpy_1d_array = np.array(sample_list)
sample_numpy_2d_array = np.array([[1,2,3],[4,5,6],[7,8,9]])

new_arr = sample_numpy_2d_array.reshape(2,6)
