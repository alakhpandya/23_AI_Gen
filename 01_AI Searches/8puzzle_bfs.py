from queue import PriorityQueue
from time import time

# start = [
#     [1,2,3],
#     [4,5,6],
#     [0,7,8]
# ]

# end = [
#     [1,2,0],
#     [4,5,3],
#     [7,8,6]
# ]


start = [
    [1,2,3],
    [4,5,6],
    [0,7,8]
]

end = [
    [1,2,3],
    [4,5,6],
    [7,8,0]
]

def h_value(node,end):
    miss=0
    for i in range(len(node)):
        for j in range((len(node))):
            if node[i][j]!=end[i][j] and node[i][j]!=0:
                miss+=1
    return miss

def creteneighbor(node):
    neighbor = []
    row ,col = -1 ,-1
    for i in range(len(node)):
        for j in range((len(node))):
            if node[i][j]==0:
                row , col = i,j
                break
        if row!=-1 and col!=-1:
            break
    # up empty space
    if i>0:
        node[row-1][col], node[row][col] = node[row][col], node[row-1][col]
        neighbor.append(node)

        # temp=[row[:] for row in node]
        # temp[i][j]=temp[i-1][j]
        # temp[i-1][j]=0
        # neighbor.append(temp)
    # down empty space
    if i<len(node)-1:
        temp=[row[:] for row in node]
        temp[i][j]=temp[i+1][j]
        temp[i+1][j]=0
        neighbor.append(temp)
    # rigth empty space
    if j<len(node)-1:
        temp=[row[:] for row in node]
        temp[i][j]=temp[i][j+1]
        temp[i][j+1]=0
        neighbor.append(temp)
    # left empty space
    if j>0:
        temp=[row[:] for row in node]
        temp[i][j]=temp[i][j-1]
        temp[i][j-1]=0
        neighbor.append(temp)
    return neighbor

# print(creteneighbor(start))
"""
def a_start_algo(start,end):
    t1=time()
    pQueue = PriorityQueue()
    order=0
    pQueue.put((h_value(start,end),order,start))
    simpleQueue=[start]

    while not pQueue.empty():
        node=pQueue.get()[2]
        if node==end:
            t2=time()
            print("Get : ",node)
            print("A* : ",(t2-t1) * 10**3, "ms")
            return simpleQueue

        for neighbor in creteneighbor(node):
            h=h_value(neighbor,end)
            if neighbor not in simpleQueue:
                pQueue.put((h,order+1,neighbor))
                simpleQueue.append(neighbor)
    return False
"""

def createPath(start, end, backtrack):
    finalPath = [end]
    currentNode = end
    while True:
        if currentNode == start:
            break
        for node in backtrack:
            if backtrack[node] == currentNode:
                finalPath.append(node)
            currentNode = node
    print(finalPath)
    return finalPath

def BFS(start,end):
    backtrack = {}
    visited=[]
    queue=[]
    queue.append(start)
    visited.append(start)
    # g_value = {tuple(start) : 0}
    # g_values = 0

    while queue:
        node=queue.pop(0)
        if node==end:
            print("BFS get",node)
            return True
        # g_values += 1
        neighbors = creteneighbor(node)
        for child in neighbors:
            if child not in visited:
                print(f"\n{child}")
                # final_path.append(child)
                queue.append(child)
                visited.append(child)
                # g_value[tuple(child)] = g_values
                backtrack[tuple(node)] = child
    return False
        
# print(a_start_algo(start,end))
print(BFS(start,end))