import numpy as np
"""
a = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
])
"""
# print(a.T)
# print(a)
# b = a.flat
# print(b)
# for i in b:
#     print(i)

# print(a.ravel())
"""
step 1: create a 1d array of numbers from 11 to 19
step 2: change its shape to 3x3
"""
# b = np.arange(11, 20)
# b = b.reshape([3, 3])

# Basic Mathematical Operations:
"""
print(a + b)
print(b - a)
print(a * b)
print(b / 2)
print(b * 2)
print(b ** 2)
print(np.sqrt(b))

c = np.array([12, 30, 6, -8, 15, 23])
print(np.where(c <= 15))

print(np.sin(b))
print(np.cos(b))
"""

"""
c = np.array([
    [12, 30, 6, -8, 15, 23],
    [17, 18, -10, 3, 16, 5]
])
print(np.where(c <= 15))
"""
# c = np.array([12, 0, 30, 6, 0, -8, 15, 0, 23, 0])
# print(np.nonzero(c))
# print(np.count_nonzero(c))
"""
c = np.array([
    [12, 0, 30, 6, 0, -8, 15, 0, 23, 0],
    [17, 18, 0, -10, 3, 16, 5, 0, 0, 0]
])
print(np.nonzero(c))
"""
# vertical stacking
"""
a = np.array([12, 0, 30, 6, 0, -8, 15, 0, 23, 0])
b = np.array([17, 18, 0, -10, 3, 16, 5, 0, 0, 0])
# c = np.vstack((b, a, a, a, b))
# print(c)
"""
# Horizontal stacking
"""
c = np.hstack((a, b))
# print(c)
"""


# Linear Algebra
a = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
])
b = np.arange(11, 20)
b = b.reshape([3, 3])

# print(np.matmul(a, b))
# print(np.linalg.det(a))
# print(np.linalg.det(b))

d = np.array([
    [6, 1, 1],
    [4, -2, 5],
    [2, 8, 7]
])
# print(np.linalg.det(d))

# print(np.linalg.inv(d))

# print(np.linalg.matrix_rank(d))
# print(np.linalg.matrix_rank(a))

a = np.array([
    [1, 1, 1],
    [6, -4, 5],
    [5, 2, 2]
])

b = np.array([2, 31, 13])

# print(np.linalg.solve(a, b))


# Stats
# print(np.sum(a))

# b = np.array([17, 18, 0, -10, 3, 16, 5])
# print(np.min(b))
# print(np.max(b))
# print(np.max(a))

# print(np.sort(b))
# print(np.sort(a))
# print(np.sort(a, axis=0))

# print(np.argmin(b))
# print(np.argmax(b))
# print(np.argsort(b))

# print(np.argmin(a))
# print(np.argmax(a))
# print(np.argsort(a))
# print(np.argsort(a, axis=0))


# Generating arrays from a file:
f = np.genfromtxt('data.txt', delimiter=',')
f = f.astype('int64')
# print(f)
# print(f >= 100)
# print(f[f >= 100])

# logical operators for the array
# print((50 <= f) & (f <= 100))
# print(~((50 > f) | (100 < f)))

a = np.arange(25, 35)
print(a)
print(a[ [1, 3, 8] ])