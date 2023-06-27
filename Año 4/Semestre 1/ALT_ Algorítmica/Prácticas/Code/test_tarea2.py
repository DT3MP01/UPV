import numpy as np


def dp_levenshtein_threshold(x, y, th):
    tamX = len(x) + 1
    # Row initialization
    prev = np.zeros(tamX, dtype=int)
    current = np.zeros(tamX, dtype=int)
    current[0] = 0
    # Adding values from 1 to N-1
    for i in range(1, len(x)+1):
        current[i] = current[i-1] + 1

    # Computing the matrix backwards (from 1 to M) and updating the previous row with the current one 
    for j in range(1, len(y) + 1):
        prev, current = current, prev
        current[0] = prev[0] + 1
        # For the current[i], adding the minimum distance between the current[i] and the previous[i-1]
        for i in range(1, len(x) + 1):
            actualValue = current[i - 1] + 1
            isSame = prev[i - 1] + (x[i - 1] != y[j - 1])
            current[i] = min(actualValue, prev[i] + 1, isSame)
        # When the minimum value of the actual row is bigger than the threshold, stopping the execution of the method and return th+1
        if min(current) > th:
            return th + 1
    return min(th + 1, current[-1])


def dp_restricted_damerau_threshold(x, y, th):
    tamX = len(x)+1
    # Row initialization
    prev1 = np.fromiter((x for x in range(tamX)), dtype=int)
    current = np.zeros(tamX, dtype=int)
    prev2 = np.zeros(tamX, dtype=int)

    # Computing the matrix backwards (from 1 to M) and updating the previous row with the current one
    for j in range(1, len(y) + 1):
        # For the current[i], adding the minimum distance between the current[i] and the previous[i-1]
        current[0] = prev1[0]+1
        for i in range(1, tamX):
            ins = current[i-1]+1
            erase = prev1[i]+1
            mod = prev1[i-1] + (x[i - 1] != y[j - 1])
            if i > 1 and j > 1 and x[i-2] == y[j-1] and x[i-1] == y[j-2]:
                current[i] = min(ins, erase, mod, prev2[i-2]+1)
            else:
                current[i] = min(ins, erase, mod)
        if np.min(current) > th:
            return th+1
        prev2, prev1, current = prev1, current, prev2

    return prev1[-1]


def dp_intermediate_damerau_threshold(x, y, th):
    tamX = len(x)+1
    # Row initialization
    prev1 = np.fromiter((x for x in range(tamX)), dtype=int)
    current = np.zeros(tamX, dtype=int)
    prev2 = np.zeros(tamX, dtype=int)
    prev3 = np.zeros(tamX, dtype=int)

    # Computing the matrix backwards (from 1 to M) and updating the previous row with the current one
    for j in range(1, len(y) + 1):
        current[0] = prev1[0] + 1
        for i in range(1, tamX):
            ins = current[i - 1] + 1
            erase = prev1[i] + 1
            mod = prev1[i - 1] + (x[i - 1] != y[j - 1])
            if i > 1 and j > 1 and x[i - 2] == y[j - 1] and x[i - 1] == y[j - 2]:
                current[i] = min(ins, erase, mod, prev2[i-2]+1)
            elif i > 1 and j > 2 and (x[i - 2] == y[j - 1] and x[i - 1] == y[j - 3]):
                current[i] = min(ins, erase, mod, prev3[i-2]+2)
            elif i > 2 and j > 1 and (x[i - 3] == y[j - 1] and x[i - 1] == y[j - 2]):
                current[i] = min(ins, erase, mod, prev2[i-3]+2)
            else:
                current[i] = min(ins, erase, mod)
        if np.min(current) > th:
            return th + 1
        prev3, prev2, prev1, current = prev2, prev1, current, prev3

    return prev1[-1]


# test = [
#     ("algoritmo", "algortimo"),
#     ("algoritmo", "algortximo"),
#     ("algoritmo", "lagortimo"),
#     ("algoritmo", "agaloritom"),
#     ("algoritmo", "algormio"),
#     ("acb", "ba")]
# 
# test = [
#     ("senor", "no"),
#     ("casa", "vas"),
#     ("casa", "tasa"),
#     ("casa", "pasa"),
#     ("casa", "jkjsdf"),
#     ("casa", "ba")
# ]

# thrs = range(1, 4)

# for threshold in thrs:
#     print(f"thresholds: {threshold:3}")
#     for x, y in test:
#         print(f"{x:12} {y:12} \t", end="")
#         for dist, name in ((dp_levenshtein_threshold, "levenshtein"),
#                            (dp_restricted_damerau_threshold, "restricted"),
#                            (dp_intermediate_damerau_threshold, "intermediate")):

#             print(f" {name} {dist(x,y,threshold):2}", end="")
#         print()


"""
Salida del programa:

thresholds:   1
algoritmo    algortimo    	 levenshtein  2 restricted  1 intermediate  1
algoritmo    algortximo   	 levenshtein  2 restricted  2 intermediate  2
algoritmo    lagortimo    	 levenshtein  2 restricted  2 intermediate  2
algoritmo    agaloritom   	 levenshtein  2 restricted  2 intermediate  2
algoritmo    algormio     	 levenshtein  2 restricted  2 intermediate  2
acb          ba           	 levenshtein  2 restricted  2 intermediate  2
thresholds:   2
algoritmo    algortimo    	 levenshtein  2 restricted  1 intermediate  1
algoritmo    algortximo   	 levenshtein  3 restricted  3 intermediate  2
algoritmo    lagortimo    	 levenshtein  3 restricted  2 intermediate  2
algoritmo    agaloritom   	 levenshtein  3 restricted  3 intermediate  3
algoritmo    algormio     	 levenshtein  3 restricted  3 intermediate  2
acb          ba           	 levenshtein  3 restricted  3 intermediate  2
thresholds:   3
algoritmo    algortimo    	 levenshtein  2 restricted  1 intermediate  1
algoritmo    algortximo   	 levenshtein  3 restricted  3 intermediate  2
algoritmo    lagortimo    	 levenshtein  4 restricted  2 intermediate  2
algoritmo    agaloritom   	 levenshtein  4 restricted  4 intermediate  3
algoritmo    algormio     	 levenshtein  3 restricted  3 intermediate  2
acb          ba           	 levenshtein  3 restricted  3 intermediate  2
"""
