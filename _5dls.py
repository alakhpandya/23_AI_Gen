# Depth limited search
from _1graph_input import graph

def dls(start, goal, path, maxDepth, level):
    path.append(start)
    if start == goal:
        return path
    if level == maxDepth:
        return False
    for child in graph[start]:
        if dls(child, goal, path, maxDepth, level+1):
            return path

path = []

# start_state = input("Start State: ")
start_state = 'A'

# level = int(input(f"Level of {start_state}: "))
level = 0

# goal_state = input("Goal State: ")
goal_state = 'D4'

maxDepth = int(input("Maximum Allowed Depth: "))
sol = dls(start_state, goal_state, path, maxDepth, level)
if sol:
    print(f"The path is: {path}")
else:
    print(f"Could not find goal state within level {maxDepth}")