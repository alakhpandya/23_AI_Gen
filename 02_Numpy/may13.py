import numpy as np

# a = np.array([15, 30, -20, -18, 100])
# print(a[2])

# Creating 2D arrays
# a = np.array(([1,2,3,4,5,6,7], [8,9,10,11,12,13,14]))
# print(a)
# print(a.shape)
# print(a[1, 3])
# print(a[1, 2 : 7])
# a[0, 1] = 35
# a[0, 1:6] = [35, 36, 37, 38, 39]
# print(a[1, :])
# print(a[:, 1])
# a[:, 1] = [22, 99]
# print(a[1, 1 : 7 : 2])
# print(a[1, 6 : 0 : -2])
"""
a = np.array(([
        [
            [1, 2], [3, 4]
            ], 
        [
            [4, 5], [6, 7]
            ], 
        [
            [8, 9], [10, 11]
            ]
    ]))
# print(a[:, 0, :])
a[:, 0, :] = [
    [9, 9],
    [9, 9],
    [9, 9]
]

print(a)
"""

# For loop in np arrays
"""
a = np.array(([1,2,3,4,5,6,7], [8,9,10,11,12,13,14]))
for row in a:
    # print(row)
    for n in row:
        print(n)
    print()
"""

# Creating np arrays from python collections
"""
l = [1,2,3]
a = np.array(l)
print(a)

t = [1,2,3]
b = np.array(t)
print(b)
"""
# not of much use for our purpose
"""
s = {1,2,3}
c = np.array(s)
print(c)
print(c.dtype)

d = {1 : 2, 11 : 22, 111 : 222}
e = np.array(d)
print(e)
"""

# Intrinsic Methods:
# a = np.zeros(5)
# a = np.zeros((5, 2))
# a = np.zeros((5, 2, 3))
# a = np.empty((4, 2))


# a = np.ones(4)
# a = np.ones((4, 3))
# a = np.ones((4, 3), dtype="int16")

# a = np.full((3, 4), 99)
# print(a)

a = np.array(([1,2,3,4,5,6,7], [8,9,10,11,12,13,14]))
# b = np.full((a.shape), 100)
# b = np.full_like(a, 50)
# print(b)

# a = np.random.rand(4, 2)
# a = np.random.randint(100, size=(3, 3))
# a = np.random.randint(5, 100, size=(3, 3))
# print(a)

# b = np.random.random_sample(a.shape)
# b = np.random.random_sample((3, 5))
# print(b)

# a = np.identity(5, dtype="int16")
# a = np.arange(100)
# a = np.arange(10, 20)
# a = np.arange(10, 50, 4)

# a = np.linspace(11, 50, 4)
# a = np.linspace(11, 50, 5)

# Solution to the quiz:
"""
a = np.ones((5,5), dtype="int8")
# a = np.array([
#     [1,2,3,4,5],
#     [6,7,8,9,10],
#     [11,12,13,14,15],
#     [16,17,18,19,20],
#     [21,22,23,24,25]
# ])
b = np.zeros((3,3), dtype="int8")
b[1,1] = 9
a[1:4, 1:4] = b
# print(b)
print(a)
"""

a = np.array([
    [1,2,3,4,5],
    [6,7,8,9,10],
    [11,12,13,14,15],
    [16,17,18,19,20],
    [21,22,23,24,25]
])

# print(a.size)
# print(a.itemsize)
# print(a.dtype)
# print(a.nbytes)

# print(a.T)

b = np.arange(1, 26)
# print(b)
b = b.reshape((5, 5))
print(b)