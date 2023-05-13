import numpy as np
"""
a = np.array([1, 2, 3, 4, 5])
print(a)
b = np.array([[1, 2], [3, 4]])
print(b)
c = np.array([[1, 2], [3, 4], [5, 6, 7]])
print(c)

d = np.array([[[1, 2], [3, 4]], [[1, 2], [3, 4]]])
# print(d)
print(d.ndim)   # ndim: Number Dimesion/Number of Dimensions

e = np.array([1, 2, 3], ndmin=3)
print(e)

# np arrays: they usually carry same type of data

f = np.array([1, 2, 3.5])
print(f)

g = np.array([1, 2, 3.5, "numpy"])
print(g)

# h = np.array([1, 2, 3], dtype='float')
h = np.array([1, 2, 3], dtype='complex')
print(h)
"""
"""
a = [1, 2, 3]
b = [4, 5, 6]
print(a + b)

c = np.array([1, 2, 3])
d = np.array([4, 5, 6])
print(c + d)

# print(a * b)
print(c * d)

e = np.array([1, 2, 3], dtype="int16")
print(e)

print(e.dtype)
f = np.array([(1, 2)], dtype=[("a", "<i2"), ("b", "<f4")])
print(f)
"""

a = np.array([1, 2, 3])
mat1 = np.mat(a)
# print(mat1)
# print(mat1.dtype)
# print(isinstance(mat1, np.matrix))
# print(isinstance(mat1, np.ndarray))

# print(isinstance(a, np.ndarray))
# print(isinstance(a, np.matrix))

# a[0] = 5
# print(a)

# class A:
#     pass

# class B(A):
#     pass

# print(issubclass(B, A))

print(issubclass(np.matrix, np.ndarray))