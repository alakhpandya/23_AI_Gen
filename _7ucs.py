class Problem():
    def __init__(self):
        # self.createGraph()
        self.graph = {
            'A' : [(1, 'B1'), (2, 'B2'), (3, 'B3')],
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



p1 = Problem()
print(p1.graph)