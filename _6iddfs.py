# Iterative Deepening Depth First Search or
# Iterative Deepening Depth Limited Search

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
        
def iddfs(start, goal, path, maxDepthLimit):
    for maxDepth in range(maxDepthLimit+1):
        if dls(start, goal, path, maxDepth, 0):
            return path


path = []

# start_state = input("Start State: ")
start_state = 'A'

# goal_state = input("Goal State: ")
goal_state = 'D4'

maxDepthLimit = int(input("Maximum Allowed Depth Limit: "))
sol = iddfs(start_state, goal_state, path, maxDepthLimit)
if sol:
    print(f"The path is: {path}")
else:
    print(f"Could not find goal state within level {maxDepthLimit}")

"""
IDDFS is complete
IDDFS is optimal
Time Complexity: b^d
Space Complexity: O(d)
"""