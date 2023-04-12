# Imports Area
import pygame
from pygame.locals import *
from queue import PriorityQueue


# Constants / Global Variables Area
WIDTH = 700     # input from user
# HEIGHT
WINDOW = pygame.display.set_mode((WIDTH, WIDTH))
pygame.display.set_caption("A* Algorithm Visualization")

RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
ORANGE = (255, 168, 0)
YELLOW = (255, 255, 0)
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
AQUA = (128, 255, 255)
GREY = (128, 128, 128)
PURPLE = (128, 0, 128)


# Functions Area
class Node():
    def __init__(self, row, col, width, total_rows):
        self.row = row
        self.col = col
        self.x = col * width
        self.y = row * width
        self.color = WHITE
        self.neighbors = []
        self.width = width
        self.total_rows = total_rows

    def draw(self, window):
        pygame.draw.rect(window, self.color, (self.x, self.y, self.width, self.width))

    # Type A: Changing colors of the node   def make_black: self.color = black
    def make_open(self):
        self.color = RED

    def make_green(self):
        self.color = GREEN

    def make_blue(self):
        self.color = BLUE

    def make_start_node(self):
        self.color = ORANGE

    def make_yellow(self):
        self.color = YELLOW

    def make_barrier(self):
        self.color = BLACK

    def clear(self):
        self.color = WHITE

    def make_goal_node(self):
        self.color = AQUA

    def make_grey(self):
        self.color = GREY

    def make_path(self):
        self.color = PURPLE

    # Type B: Checking color of the node    def is_black: return self.color == black
    def is_open(self):
        return self.color == RED

    def is_green(self):
        return self.color == GREEN

    def is_blue(self):
        return self.color == BLUE

    def is_start_node(self):
        return self.color == ORANGE

    def is_yellow(self):
        return self.color == YELLOW

    def is_barrier(self):
        return self.color == BLACK

    def is_white(self):
        return self.color == WHITE

    def is_goal_node(self):
        return self.color == AQUA

    def is_grey(self):
        return self.color == GREY

    def is_path(self):
        return self.color == PURPLE
    
    def generate_neighbors(self, grid):
        # look up:
        if self.row > 0:
            node = grid[self.row - 1][self.col]
            if not node.is_barrier():
                self.neighbors.append(node)
    
        # look down:
        if self.row < self.total_rows - 1:
            node = grid[self.row + 1][self.col]
            if not node.is_barrier():
                self.neighbors.append(node)
    
        # look left:
        if self.col > 0:
            node = grid[self.row][self.col - 1]
            if not node.is_barrier():
                self.neighbors.append(node)
    
        # look right:
        if self.col < self.total_rows - 1:
            node = grid[self.row][self.col + 1]
            if not node.is_barrier():
                self.neighbors.append(node)
    
    def get_node_position(self):
        return self.row, self.col

def make_grid(rows, width):
    grid = []
    node_width = width // rows
    for i in range(rows):
        temp = []
        for j in range(rows):
            node = Node(i, j, node_width, rows)
            temp.append(node)
        grid.append(temp)
    return grid


def draw_grid(window, rows, width):
    gap = width // rows
    for i in range(rows):
        pygame.draw.line(window, GREY, (0, i * gap), (width, i * gap))      # drawing 6 horizontal lines if rows = 6
        for j in range(rows):
            pygame.draw.line(window, GREY, (j * gap, 0), (j * gap, width))  # drawing 6 vertical lines if rows = 6


def draw(window, grid, rows, width):
    window.fill(WHITE)
    for row in grid:
        for node in row:
            node.draw(window)
    draw_grid(window, rows, width)
    pygame.display.update()

def get_click_pos(pos, rows, width):
    node_width = width // rows
    x, y = pos
    row = y // node_width
    col = x // node_width
    return row, col

def create_path(window, grid, rows, width, backtrack, node):
    print(backtrack)
    while node in backtrack:
        node = backtrack[node]
        node.make_path()
        print("loop started.")
        print("loop exit done.")
        draw(window, grid, rows, width)

def h(node_position, goal_position):
    node_x, node_y = node_position
    goal_x, goal_y = goal_position
    return abs(goal_x - node_x) + abs(goal_y - node_y)

def aStar_algo(window, rows, width, grid, start, end):
    # print("A-Star Started...")
    open = PriorityQueue()
    order = 0

    backtrack = {}
    g_values = {}
    f_values = {}
    for row in grid:
        for node in row:
            g_values[node] = float("inf")
            f_values[node] = float("inf")
    g_values[start] = 0
    f_values[start] = h(start.get_node_position(), end.get_node_position())
    
    open.put((f_values[start], f_values[start], order, start))

    open_simplified = {start}
    while not open.empty():
        for event in pygame.event.get():
            if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
                pygame.quit()
        node = open.get()[3]

        if node == end:
            create_path(window, grid, rows, width, backtrack, end)
            end.make_goal_node()
            return True
        
        for neighbor in node.neighbors:
            g_values[neighbor] = g_values[node] + 1
            h_value = h(neighbor.get_node_position(), end.get_node_position())
            f_values[neighbor] = g_values[neighbor] + h_value
            backtrack[neighbor] = node

            if neighbor not in open_simplified:
                open_simplified.add(neighbor)
                order += 1
                open.put((f_values[neighbor], h_value, order, neighbor))
                neighbor.make_open()

        draw(window, grid, rows, width)

    return False

def main(width, window):
    ROWS = 5
    grid = make_grid(ROWS, width)
    
    start = None
    end = None

    running = True
    started = False

    while running:
        draw(window, grid, ROWS, width)
        for event in pygame.event.get():
            if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
                running = False
            if started:
                continue
            if pygame.mouse.get_pressed()[0]:       # left clicked
                pos = pygame.mouse.get_pos()
                row, col = get_click_pos(pos, ROWS, width)
                node = grid[row][col]
                if not start and node != end:
                    start = node
                    node.make_start_node()
                elif not end and node != start:
                    end = node
                    node.make_goal_node()
                elif node != start and node != end:
                    node.make_barrier()

            if pygame.mouse.get_pressed()[2]:       # right clicked
                pos = pygame.mouse.get_pos()
                row, col = get_click_pos(pos, ROWS, width)
                node = grid[row][col]
                if node == start:
                    start = None
                elif node == end:
                    end = None
                node.clear()
                
            if event.type == KEYDOWN:
                started = True
                if event.key == K_SPACE and start and end:
                    for row in grid:
                        for node in row:
                            node.generate_neighbors(grid)
                aStar_algo(window, ROWS, width, grid, start, end)

    pygame.quit()

# Main Program
main(WIDTH, WINDOW)
