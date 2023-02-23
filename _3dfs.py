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

