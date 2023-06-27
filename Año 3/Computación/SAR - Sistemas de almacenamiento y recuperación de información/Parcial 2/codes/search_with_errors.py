import numpy as np


def sust(a: str, b: str) -> int:
    return 1 if a != b else 0


def search_PD(T: str, P: str):
    tabla = {}
    for j in range(len(P) + 1):
        tabla[j, 0] = j
    for i in range(len(T)):
        tabla[0, i + 1] = 0  # cualquier posición de inicio
        for j in range(len(P)):
            tabla[j + 1, i + 1] = min(
                tabla[j, i + 1] + 1,
                tabla[j + 1, i] + 1,
                tabla[j, i] + sust(T[i], P[j])
            )

    return tabla


string = input('String: ')
pattern = input('Pattern to be found in the string: ')
print()

i, j = zip(*search_PD(string, pattern).keys())
a = np.zeros((max(i) + 1, max(j) + 1), np.int32)
np.add.at(a, tuple((i, j)), tuple(search_PD(string, pattern).values()))

print(a[::-1],'\n')

# print(search_PD(string, pattern))
