import networkx as nx
from pprint import pprint
import pandas as pd
import numpy as np


def main():

    # Where do the states go to
    edge_list = [('d1', 'd0'),
                 ('d2', 'd0'), ('d2', 'd1'), ('d2', 'd3'),
                 ('d3', 'd1'), ('d3', 'd2')]

    node_set = set()
    for edge in edge_list:
        node_a, node_b = edge
        node_set.add(node_a)
        node_set.add(node_b)

    node_list = sorted(list(node_set))

    G = nx.DiGraph()
    G.add_nodes_from(node_list)
    G.add_edges_from(edge_list)

    adj_matrix = nx.to_numpy_matrix(G)

    # adj_list = nx.to_dict_of_lists(G)
    # pprint(adj_list)

    df_adj = pd.DataFrame(
        adj_matrix,
        columns=node_list,
        index=node_list,
        dtype="int64"
    )

    print('Adjacency matrix:', '\n\n', df_adj, '\n\n')

    auth, hub = calc_hits_algorithm(adj_matrix=adj_matrix)

    df_auth = pd.DataFrame(
        auth,
        columns=["authority"],
        index=node_list
    )

    df_hub = pd.DataFrame(
        hub,
        columns=["hubs"],
        index=node_list
    )

    df_result = pd.concat([df_auth, df_hub], axis=1)

    pprint("Result")
    pprint(df_result)


def calc_hits_algorithm(adj_matrix, iter=5, normalize=False, delta=0):
    g, _ = adj_matrix.shape
    auth = np.ones((g, 1))
    hub = np.ones((g, 1))

    print('Iter', 0, '\n', '\nHub: \n',
          auth.transpose(), '\n\n', 'Authority: \n', hub.transpose(), '\n\n')

    for k in range(1, iter):
        auth_k_1 = auth
        hub_k_1 = hub

        hub = np.matmul(auth_k_1.transpose(), adj_matrix).transpose()
        auth = np.matmul(hub_k_1.transpose(),
                         adj_matrix.transpose()).transpose()

        print('Iter', k, '\n', 'Hub: \n',
              auth.transpose(), '\n\n', 'Authority: \n', hub.transpose(), '\n\n')

    print("Iter count: ", k, '\n')
    return auth, hub


if __name__ == "__main__":
    main()
