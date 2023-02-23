from _1graph_input import graph

def bfs(graph, startNode, goalNode):
    queue = []
    expanded = []
    queue.append(startNode)
    while queue:
        current_node = queue.pop(0)
        expanded.append(current_node)
        if current_node == goalNode:
            return expanded
        for child in graph[current_node]:
            queue.append(child)

    return False

startNode = "A"
goalNode = "D2"
# goalNode = "D5"
path = bfs(graph, startNode, goalNode)
if path:
    print(path)
else:
    print("Couldn't find the goal state.")


"""
1. BFS is Complete.
2. BFS is Optimal provided that all edges have equal weights.
"""
"""
1. Completeness: Is it guaranteed that you will always find the goal state if goal state exists.
2. Optimality: Is it guaranteed that the solution that you found is most optimal?
3. Time Complexity: 
4. Space Complexity: 
"""