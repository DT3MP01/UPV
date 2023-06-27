def trivial_search(T: str, P: str) -> int:
    for i in range(len(T) - len(P) + 1):
        j = 0
        while j < len(P) and T[i + j] == P[j]:
            j += 1
        if j == len(P):
            return i  # encontrado
    return -1  # no encontrado

string = input('String: ')
pattern = input('Pattern to be found in the string: ')

print('Distance:', trivial_search(string, pattern))

