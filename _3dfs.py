from _1graph_input import graph

expanded = []
def dfs(node):
    global expanded
    if node not in expanded:
        expanded.append(node)
        for child in graph[node]:
            dfs(child)
    return expanded

print(dfs("A"))

"""
1. DFS is Complete only if none of the leg is goning infinite.
2. DFS is NOT Optimal.
3. Time Complexity: O(b^d); b = branching factor, d = depth of goal state
4. Space Complexity: O(d)
"""