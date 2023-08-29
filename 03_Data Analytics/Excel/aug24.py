import random
"""
a = 1
b = 1000
p = 0
q = 0
r = 0
s = 0
for i in range(10000):
    n = random.randint(a, b)
    if 1 <= n <= 250:
        p += 1
    elif 250 < n <= 500:
        q += 1
    elif 500 < n <= 750:
        r += 1
    else:
        s += 1
print(p)
print(q)
print(r)
print(s)
"""
print("Player-A\tPlayer-B".expandtabs(10))
for i in range(20):
    # print(round(random.normalvariate(7, 0.25), 1))
    # print(round(random.normalvariate(7, 1), 1))
    print(f"{int(random.normalvariate(50, 20))}\t{int(random.normalvariate(50, 5))}".expandtabs(10))