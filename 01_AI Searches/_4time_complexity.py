"""
Write a recursive function that returns nth term of Fibonacci sequence. Use that function in the main program, ask user the number of terms she wants to print & do accordingly using the function.
"""
# Explicit Memoization
"""
memory = []
def fibo(n):
    global memory
    if n <= len(memory):
        return memory[n-1]
    if n == 1:
        memory.append(0)
        return 0
    elif n == 2:
        memory.append(1)
        return 1
    else:
        term = fibo(n-1) + fibo(n-2)
        memory.append(term)
        return term
"""

# Implicit Memoization
"""
from functools import lru_cache

@lru_cache(maxsize=3)      # decorators / wrapper functions
def fibo(n):
    if n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        return fibo(n-1) + fibo(n-2)
    
n = int(input("n: "))
for i in range(1, n+1):
    print(f"{i})\t{fibo(i)}")
"""

# Time Complexity (Big O): How efficient our algorithm performs as the size of the input tends to infinite.
"""
O(1)        Constant
O(log n)    Logarithmic
O(n)        Linear
O(nlog n)   Linearithmic
O(n^2)      Quadratic
O(n^3)      Cubic
O(2^n)      Exponential
O(n!)       Factorial
"""
"""
def constant(n):
    print("Hello Wolrd!")       # O(1)
    a = 98765                   # O(1)
    b = 12345                   # O(1)
    c = a ** b                  # O(1)
    print(c)                    # O(1)

constant(5000000000000000)
"""
"""
def linear(n):
    print("Hello Wolrd!")       # O(1)
    a = 98765                   # O(1)
    b = 12345                   # O(1)
    c = a ** b                  # O(1)
    for i in range(n):
        print(i)                # O(n)      Worst
        print(i)                # O(n)
        print(i)                # O(n)

    # time complexity of the entire program = O(n)
linear(5)
"""
"""
def quadratic(n):
    k = 1
    print("Hello World!")       # O(1)
    for i in range(n):
        print(i)                # O(n)
        for j in range(n):  
            print("\t", k)      # O(n^2)
            k += 1

quadratic(5)
"""
"""
def cubic(n):
    k = 1
    print("Hello World!")           # O(1)
    for i in range(n):
        print(i)                    # O(n)
        for j in range(n):  
            print(j)                # O(n^2)
            for p in range(n):
                print("\t", k)      # O(n^3)
                k += 1

cubic(7)
"""
"""
def logarithmic(n):
    i = 1
    n = n // 2
    while n > 0:
        print(i)
        i += 1
        n //= 2

logarithmic(16)
"""
"""
def logarithmic(n):
    temp = n
    i = 1
    n = n // 2
    while n > 0:
        for j in range(temp):       # 3 times                   # O(log n)
            print(i)                # 8 iterations each times   # n iterations each time = O(nlog n)
            i += 1
        n //= 2

logarithmic(8)
"""
# Exponential - O(2^n)
# Fibonacci Sequence Program

# Factorial Time complexity - O(n!)
"""
def factorial(n):
    if n == 0:
        print("*")
        return
    for i in range(n):
        factorial(n-1)

factorial(3)
"""
# Quiz on time complexity, Space Complexity



# Recursion Skill Test
"""
def bar(x, y):
    if y == 0:
        return 0
    return (x + bar(x, y-1))

def foo(x, y):
    if y == 0:
        return 1
    return bar(x, foo(x, y-1))

print(foo(3, 5))
"""

# Space Complexity:
"""
def countDown(n):
    print(n)
    if n == 0:
        return 1
    return countDown(n-1) * 1

# Space Complexity: O(n)

countDown(5)
"""
# Function - 1
def twoLoops(n):
    for i in range(n):
        pass
    for j in range(n):
        pass
    

# Function - 2
def twoInputs(a, b):
    for i in range(a):
        pass             
    for j in range(b):
        pass             


# Function - 3
def twoInputs(a, b):
    for i in range(a):
        pass
        for j in range(b):
            pass


# Next Class: 4 properties of bfs, dfs, their advantages & disadvantages & solutions