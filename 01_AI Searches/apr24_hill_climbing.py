from random import choice

tsp = [
    [0, 300, 500, 400],
    [300, 0, 400, 500],
    [500, 400, 0, 300],
    [400, 500, 300, 0]
]

def createRandomRoute(tsp):
    noOfCities = len(tsp)
    cities = [x for x in range(noOfCities)]
    route = []
    while cities:
        new_city = choice(cities)
        route.append(new_city)
        cities.remove(new_city)
    return route

def findRouteLength(route):
    # route = [2, 0, 1, 3]
    dist = 0
    for i in range(len(route)-1):
        # print("i =", i)
        # print(f"route[{i}] : {route[i]}")
        # print(f"route[{i+1}] : {route[i+1]}")
        # print(f"tsp[{i}] : {tsp[i]}")
        # print(f"tsp[{i+1}] : {tsp[i+1]}")
        dist += tsp[route[i]][route[i+1]]
    dist += tsp[route[0]][route[len(route)-1]]
    return dist
    

def createNeighbors(route):
    neighbors = []
    for i in range(len(route)):
        for j in range(i+1, len(route)):
            neighbor = route.copy()
            neighbor[i], neighbor[j] = neighbor[j], neighbor[i]
            neighbors.append(neighbor)
    return neighbors

def selectBestNeighbor(route, neighbors):
    shortestLength = findRouteLength(neighbors[0])
    bestNeighbor = neighbors[0]
    for neighbor in neighbors:
        currentRouteLength = findRouteLength(neighbor)
        if currentRouteLength < shortestLength:
            shortestLength = currentRouteLength
            bestNeighbor = neighbor
    print(shortestLength, bestNeighbor)
    return shortestLength, bestNeighbor

def main():
    route = createRandomRoute(tsp)
    # print(route)
    # print(findRouteLength(route))
    while True:
        neighbors = createNeighbors(route)
        # print(neighbors)
        # print()
        # print(selectBestNeighbor(route, neighbors))
        # print()
        length1 = findRouteLength(route)
        length2, tempRoute = selectBestNeighbor(route, neighbors)
        if length1 <= length2:
            break
        route = tempRoute
    """
    [2, 0, 1, 3]
    neighbors: [0, 2, 1, 3], [2, 1, 0, 3], [2, 0, 3, 1], [3, 0, 1, 2]
    rout_length: 1600, 1700, 1500, 1600
    """

if __name__ == "__main__":
    main()


# HW: Using BFS, solve 8 puzzle game.
"""
start = [
    [1, 2, 3],
    [4, 5, 6],
    [0, 7, 8]
]

goal = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0]
]

"""

# HW2: Create tsp using cities: Ahmedabad, Surat, Jamnagar, Nadiad, Bhuj, Himmatnagar - 
# create a dictionary like: {0 : "Ahmedabad", ...}
# create tsp list = list of distances
# at the end, instead of displaying route like: [0, 2, 3, 1, 5, 4] 
# display the route like: Ahemdabad - Jamnagar - ... - Ahmedabad