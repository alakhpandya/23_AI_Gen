# Imports Area
import pygame
from pygame.locals import *
from queue import PriorityQueue


# Constants / Global Variables Area
WIDTH = 600     # input from user
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
    def make_red(self):
        self.color = RED

    def make_green(self):
        self.color = GREEN

    def make_blue(self):
        self.color = BLUE

    def make_orange(self):
        self.color = ORANGE

    def make_yellow(self):
        self.color = YELLOW

    def make_black(self):
        self.color = BLACK

    def make_white(self):
        self.color = WHITE

    def make_aqua(self):
        self.color = AQUA

    def make_grey(self):
        self.color = GREY

    def make_purple(self):
        self.color = PURPLE

    # Type B: Checking color of the node    def is_black: return self.color == black
    def is_red(self):
        return self.color == RED

    def is_green(self):
        return self.color == GREEN

    def is_blue(self):
        return self.color == BLUE

    def is_orange(self):
        return self.color == ORANGE

    def is_yellow(self):
        return self.color == YELLOW

    def is_black(self):
        return self.color == BLACK

    def is_white(self):
        return self.color == WHITE

    def is_aqua(self):
        return self.color == AQUA

    def is_grey(self):
        return self.color == GREY

    def is_purple(self):
        return self.color == PURPLE
    
    def make_start_node(self):
        self.color = ORANGE

    def make_goal_node(self):
        self.color = AQUA

    def make_barrier(self):
        self.color = BLACK


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

def main(width, window):
    ROWS = 8
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
            if pygame.mouse.get_pressed()[0]:
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
            if pygame.mouse.get_pressed()[2]:
                pos = pygame.mouse.get_pos()
                row, col = get_click_pos(pos, ROWS, width)
                node = grid[row][col]
                if node == start:
                    start = None
                elif node == end:
                    end = None
                node.make_white()
                


# Main Program
main(WIDTH, WINDOW)
