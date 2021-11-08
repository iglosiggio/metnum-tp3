import numpy as np
import metnum

x = np.array([0, 1, 2, 3])
y = np.array([-1, 0.2, 0.9, 2.1])
A = np.vstack([x, np.ones(len(x))]).T

np_res = np.linalg.lstsq(A, y, rcond=None)[0]
m, c = np_res

metnum_res = metnum.least_squares(A, y)
m2, c2 = metnum_res

print('A:', A)
print('y:', y)
print('np result:', np_res)
print('metnum result:', metnum_res)

#import matplotlib.pyplot as plt
#_ = plt.plot(x, y, 'o', label='Original data', markersize=10)
#_ = plt.plot(x, m*x + c, 'r', label='np fit')
#_ = plt.plot(x, m2*x + c2, 'r', label='metnum fit')
#_ = plt.legend()
#plt.show()
