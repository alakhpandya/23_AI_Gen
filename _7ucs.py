from queue import PriorityQueue

class Problem():
    def __init__(self):
        # self.createGraph()

        self.graph = {
            'A' : [(2, 'B1'), (1, 'B2'), (3, 'B3')],
            'B1' : [(4, 'C1'), (1, 'C2')],
            'B2' : [(3, 'C3')],
            'B3' : [(6, 'C4'), (0, 'C5')],
            'C1' : [(2, 'D1')],
            'C2' : [],
            'C3' : [(1, 'D2'), (3, 'D3')],
            'C4' : [],
            'C5' : [(3, 'D4')],
            'D1' : [],
            'D2' : [],
            'D3' : [],
            'D4' : []
        }
        """
        self.graph = {
            'A' : [(2, 'B1'), (1, 'B2'), (3, 'B3')],
            'B1' : [(6, 'C1'), (3, 'C2')],
            'B2' : [(4, 'C3')],
            'B3' : [(9, 'C4'), (3, 'C5')],
            'C1' : [(8, 'D1')],
            'C2' : [],
            'C3' : [(5, 'D2'), (7, 'D3')],
            'C4' : [],
            'C5' : [(6, 'D4')],
            'D1' : [],
            'D2' : [],
            'D3' : [],
            'D4' : []
        }
        """
    def createGraph(self):
        graph = {}
        root = input("Enter node : ")
        numberOfChild=int(input("Enter number of chlid : "))
        childlist = []
        for i in range(numberOfChild):
            childNode = input(f"Enter child node {root} of {i+1} : ")
            cost=int(input('Enter the cost : '))
            childcost = (cost,childNode)
            childlist.append(childcost)
        graph[root]=childlist
        masterList = list(graph.values())
        # print(masterList)
        for nodeList in masterList:
            for node in nodeList:
                numberOfChild=int(input(f"Enter number {node[1]} of chlid : "))
                childL=[]
                for i in range(numberOfChild):
                    childNode = input(f"Enter child {node[1]} of {i+1} : ")
                    cost=int(input('Enter the cost : '))
                    childcost = (cost,childNode)
                    childL.append(childcost)
                graph[node]=childL
                masterList.append(childL)
        self.graph = graph

    def isGoalState(self, node, goalState):
        return node == goalState

    def ucs(self):
        visited = []
        pq = PriorityQueue()
        start = input("Start State: ")
        pq.put((0, start))
        goal = input("Goal State: ")

        while not pq.empty():
            item = pq.get()
            current_node = item[1]
            if self.isGoalState(current_node, goal):
                print(current_node)
                pq.queue.clear()
            else:
                if current_node in visited:
                    continue
                print(current_node)
                visited.append(current_node)
                for child in self.graph[current_node]:
                    pq.put(child)

p1 = Problem()
# print(p1.graph)
p1.ucs()



# HW: Search what is defaultdict in Python (hint: it is in collections module), how to use it and if we can somehow use it in createGraph() method.