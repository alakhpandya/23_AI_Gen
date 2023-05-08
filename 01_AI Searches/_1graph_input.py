def takeGraph():
    graph = {}
    root = input("Enter root node: ")
    noOfChildren = int(input("No of children: "))
    children = []
    for x in range(noOfChildren):
        child = input(f"Child-{x+1}: ")
        children.append(child)
    graph[root] = children
    masterList = list(graph.values())
    print("masterList: ", masterList)
    for nodeList in masterList:
        print("nodeList: ", nodeList)
        for node in nodeList:
            numberOfChildren = int(input(f"No of children of {node}: "))
            childrenList = []
            for x in range(numberOfChildren):
                child = input(f"Child-{x+1}: ")
                childrenList.append(child)
            print("childrenList: ", childrenList)
            graph[node] = childrenList
            masterList.append(childrenList)
    return graph

graph = {
    'A' : ['B1', 'B2', 'B3'],
    'B1' : ['C1', 'C2'],
    'B2' : ['C3'],
    'B3' : ['C4', 'C5'],
    'C1' : ['D1'],
    'C2' : [],
    'C3' : ['D2', 'D3'],
    'C4' : [],
    'C5' : ['D4'],
    'D1' : [],
    'D2' : [],
    'D3' : [],
    'D4' : []
}
if __name__ == "__main__":
    print(takeGraph())