import sys
import json
import numpy as np


def create_stochastic(adj_list):
    n = len(adj_list)
    matrix = np.zeros((n, n))
    for col, line in enumerate(adj_list):
        if len(line) > 0:
            for index in line:
                matrix[index][col] = 1/(len(line))
        else:
            for index in range(n):
                matrix[index][col] = 0
    return matrix


def create_transitional(stoch_matrix, adj_list):
    n = len(stoch_matrix)
    d = 0.9  # alpha
    E = np.ones((n, n))  # create matrix of 1's
    for col, line in enumerate(adj_list):
        if len(line) == 0:
            for index in range(n):
                stoch_matrix[index][col] = 1/n
    part1 = np.multiply(((1-d)/n), E)
    part2 = np.multiply(d, stoch_matrix)
    transition_matrix = np.add(part1, part2)
    return transition_matrix

## calculate pagerank
def calculate_pagerank(transition_matrix):
    print('PageRank algorithm:', '\n')
    n = len(transition_matrix)
    v1 = np.full((n, 1), 0)
    v1[0, 0] = 1
    print(v1.transpose(), '\n')
    v2 = np.matmul(transition_matrix, v1)
    count = 1
    print(v2.transpose())
    print('\n')
    for _ in range(4):
        # keep iterating multiplication until difference between v1 and v2 for all entries is under err bound
        v1 = v2
        v2 = np.matmul(transition_matrix, v1)
        count += 1
        print(v2.transpose())
        print('\n')
    print('Number of iterations:', count)
    return {'vector': v2.tolist(), 'iterations': count}


def within_err_bound(v1, v2, err_bound):
    diff_vector = np.subtract(v2, v1)
    for diff in diff_vector:
        if abs(diff) > err_bound:
            return False
    return True


def main():
    adj_list = [[0,1,2,3], [1,2,3], [], [2]] # Where do the states go
    stoch_matrix = create_stochastic(adj_list)
    print('Initial transition probability matrix:', '\n\n', stoch_matrix.transpose(), '\n')
    transition_matrix = create_transitional(stoch_matrix, adj_list)
    print('Probability matrix with teleporting:', '\n\n', transition_matrix.transpose(), '\n')
    result = calculate_pagerank(transition_matrix)
    return json.dumps(result)


if __name__ == '__main__':
    main()
