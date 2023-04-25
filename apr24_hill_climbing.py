import random

def createRandomRoute(tsp):
    noOfCities = len(tsp)
    cities = [x for x in range(noOfCities)]
    route = []
    while cities:
        new_city = random.choice(cities)
        route.append(new_city)
        cities.remove(new_city)
    return route

def findRouteLength(route, tsp):
    # route = [2, 0, 1, 3]
    dist = 0
    for i in range(len(route)-1):
        dist += tsp[route[i]][route[i+1]]
    dist += tsp[route[0]][route[len(route)-1]]
    return dist
    

tsp = [
    [0, 300, 500, 400],
    [300, 0, 400, 500],
    [500, 400, 0, 300],
    [400, 500, 300, 0]
]

def main():
    route = createRandomRoute(tsp)
    print(findRouteLength(route, tsp))
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