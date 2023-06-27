def booyer_moore(T: str, P: str) -> int:
    # cálculo de d
    d = dict((c, len(P) - P.rfind(c) - 1) for c in set(P))

    # búsqueda de P en T
    j = len(P) - 1
    while j < len(T):
        i = len(P) - 1
        while i >= 0 and P[i] == T[j]:
            i, j = i - 1, j - 1
        if i == -1:
            return j + 1 # encontrado
        elif len(P) -i > d.get(T[j], len(P)):
            j = j + len(P) - i
        else:
            j = j + d.get(T[j], len(P))
    return -1 # no encontrado


string = "OOWAAAWIWBDOCOABWD".replace(' ', '')
pattern = "DOCOA".replace(' ', '')

print(string)
print(pattern)
# string = input('String: ')
# pattern = input('Pattern to be found in the string: ')

print('Distance:', booyer_moore(string, pattern))