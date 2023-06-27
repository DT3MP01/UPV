"""
Ejercicio 6: Escribe una función que Determine si una cadena formada por
corchetes es equilibrada, es decir, si consiste enteramente de pares de apertura
/ cierre de corchetes (en ese orden), y todos los corchetes abiertos se cierran
correctamente.
"""

import string

text = input(
    'Write a string formed by brackets, and I will check if it is balanced: ')


def isBalanced(phrase):
    count_first_brackets = 0

    for char in phrase:
        if char == '[':
            count_first_brackets += 1
        elif char == ']' and count_first_brackets > 0:
            count_first_brackets -= 1

    if (count_first_brackets == 0):
        print('The string is balanced')
    else:
        print('The string is not balanced')


isBalanced(text)

# Checked with: []
# Checked with: [][]
# Checked with: [[][]]
# Checked with: ][
# Checked with: ][][
# Checked with: []][[]
# Checked with: [hola]
# Checked with: ]hola[
