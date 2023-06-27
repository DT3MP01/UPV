import numpy as np


def dp_levenshtein_backwards(x, y):
    tamX = len(x) + 1
    # Row initialization
    prev = np.zeros(tamX, dtype=np.uint64)
    current = np.zeros(tamX, dtype=np.uint64)
    current[0] = 0
    # Adding values from 1 to N-1
    for i in range(1, tamX):
        current[i] = current[i - 1] + 1

    # Computing the matrix backwards (from 1 to M) and updating the previous row with the current one 
    for j in range(1, len(y) + 1):
        prev, current = current, prev
        current[0] = prev[0] + 1
        # For the current[i], adding the minimum distance between the current[i] and the previous[i-1]
        for i in range(1, tamX):
            actualValue = current[i - 1] + 1
            isSame = prev[i - 1] + (x[i - 1] != y[j - 1])
            current[i] = min(actualValue, prev[i] + 1, isSame)

    return current[-1]


def dp_restricted_damerau_backwards(x, y):
    tamX = len(x) + 1
    # Creating a vector initialized to [0..N+1]
    prev1 = np.fromiter((x for x in range(tamX)), dtype=int)
    # Reserving a vector for the computation of the following columns
    current = np.zeros(tamX, dtype=int)
    prev2 = np.zeros(tamX, dtype=int)

    for j in range(1, len(y) + 1):
        current[0] = prev1[0] + 1
        for i in range(1, len(x) + 1):
            ins = current[i - 1] + 1
            erase = prev1[i] + 1
            mod = prev1[i - 1] + (x[i - 1] != y[j - 1])
            # Checking if value of word x in position i-1 is equal of the word y in position j
            # and value of x in position i is equal of y in position j-1.
            # In that case, it could traspose and the cost would be 1
            if i > 1 and j > 1 and x[i - 2] == y[j - 1] and x[i - 1] == y[j - 2]:
                current[i] = min(ins, erase, mod, prev2[i - 2] + 1)
            else:
                current[i] = min(ins, erase, mod)
        prev2, prev1, current = prev1, current, prev2

    return prev1[-1]


def dp_intermediate_damerau_backwards(x, y):
    tamX = len(x)+1
    # Creating a vector initialized to [0..m+1]
    prev1 = np.fromiter((x for x in range(tamX)), dtype=int)
    # Reserving a vector for the computation of the following columns
    current = np.zeros(tamX, dtype=int)
    prev2 = np.zeros(tamX, dtype=int)
    prev3 = np.zeros(tamX, dtype=int)
    for j in range(1, len(y) + 1):
        current[0] = prev1[0] + 1
        for i in range(1, len(x)+1):
            ins = current[i - 1] + 1
            erase = prev1[i]+1
            mod = prev1[i - 1] + (x[i - 1] != y[j - 1])
            if i > 1 and j > 1 and x[i - 2] == y[j - 1] and x[i - 1] == y[j - 2]:
                current[i] = min(ins, erase, mod, prev2[i-2]+1)
            # In this case it would be the same as the previous one, but there could be one letter in the middle of word y     
            elif i > 1 and j > 2 and (x[i - 2] == y[j - 1] and x[i - 1] == y[j - 3]):
                current[i] = min(ins, erase, mod, prev3[i-2]+2)
            # The other case, the word could have one letter in the middle (x)
            elif i > 2 and j > 1 and (x[i - 3] == y[j - 1] and x[i - 1] == y[j - 2]):
                current[i] = min(ins, erase, mod, prev2[i - 3] + 2)
            else:
                current[i] = min(ins, erase, mod)
        prev3, prev2, prev1, current = prev2, prev1, current, prev3

    return prev1[-1]


def dist_levenshtein_general(str1, str2, cte=1):
    n = len(str1)
    m = len(str2)

    # Creating the matrix
    dp = np.zeros((n+1, m+1), dtype=int)
    # Initializing the first row
    dp[0] = np.fromiter((x for x in range(m + 1)), dtype=int)

    # Iterating all rows 
    for i in range(1, n + 1):
        dp[i][0] = i # Initializing the first column of matrix
        
        # Iterating values of row[i]
        for j in range(1, m + 1):
            # Checking if ther letter are equals 
            if str1[i-1] == str2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 0
            else:
                # Putting the actual cost
                c = 0
                searching = True
                # Iter when don't exceed the changed cte 
                while c <= cte and searching:
                    u = 0
                    # 
                    while u <= c and searching:
                        v = 0
                        while v <= c-u and searching:
                            if i > 1 and j > 1 and str1[i-2-u] == str2[j-1] and str1[i-1] == str2[j-2-v]:
                                # print("if" i, j)
                                dp[i][j] = 1 + min(dp[1][j-1],              # insert
                                                   # delete
                                                   dp[i-1][j],
                                                   # replace
                                                   dp[i-1][j-1],
                                                   dp[i-2-u][j-2-v]+c)     # exchange
                                searching = False
                            v = v + 1
                        u = u + 1
                    # if current letter is diferent add 1 to var c
                    c = c + 1
                if searching:
                    # print("else", i, j)
                    dp[i][j] = 1 + min(dp[i][j-1],      # insert
                                       dp[i-1][j],      # delete
                                       dp[i-1][j-1])    # replace
    return dp[-1][-1]


# test = [("algoritmo", "algortimo"),
#         ("algoritmo", "algortximo"),
#         ("algoritmo", "lagortimo"),
#         ("algoritmo", "agaloritom"),
#         ("algoritmo", "algormio"),
#         ("acb", "ba")]

# test = [
#     ("casa", "zas"),
#     ("casa", "vas"),
#     ("casa", "tasa"),
#     ("casa", "pasa"),
#     ("casa", "jkjsdf"),
#     ("casa", "ba")
# ]

# for x, y in test:
#     print(f"{x:12} {y:12}", end="")
#     for dist, name in ((dp_levenshtein_backwards, "levenshtein"),
#                        (dp_restricted_damerau_backwards, "restricted"),
#                        (dp_intermediate_damerau_backwards, "intermediate"),
#                        (dist_levenshtein_general, "general")):
#         print(f" {name} {dist(x,y) }", end="")
#     print()


"""
Salida del programa:

algoritmo    algortimo    levenshtein  2 restricted  1 intermediate  1
algoritmo    algortximo   levenshtein  3 restricted  3 intermediate  2
algoritmo    lagortimo    levenshtein  4 restricted  2 intermediate  2
algoritmo    agaloritom   levenshtein  5 restricted  4 intermediate  3
algoritmo    algormio     levenshtein  3 restricted  3 intermediate  2
acb          ba           levenshtein  3 restricted  3 intermediate  2
"""
