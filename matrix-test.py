#!/usr/bin/env python3

import numpy as np

M = np.arange(1, 300**2+1)
M = M.reshape(300, 300)
Mt = M.transpose()

P = Mt.dot(M)

print(f"Max value in product is {np.amax(P)}")
print(f"Location of max value in product is {np.argmax(P)}")
