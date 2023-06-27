"""
Ejercicio 2: Un pangrama “perfecto” es un pangrama en el que cada letra del
alfabeto inglés aparece una sola vez.
Haz una función que reciba una cadena y determine si se trata de un pangrama
perfecto o no. Para ello debes suponer que los únicos caracteres que puede
contener la cadena, además de las propias letras, son espacios en blanco.
Debes ignorar el hecho de usar mayúsculas o minúsculas (por ejemplo, pasaró a
minúscula con el método .lower()).
Sugerencia: comprobar que cada una de las letras de string.ascii_lowercase
aparece una sola vez en la cadena.
"""

import string

alphabet = set(string.ascii_lowercase)
text = input("Write a perfect pangram, and I will check if it is correct: ")
stripped_text = "".join(text.lower().split())

# print(alphabet)
# print(stripped_text)


def isPerfectPangram(phrase):
    answer = len(alphabet) == len(stripped_text)
    return answer


print(isPerfectPangram(input))

# Checked with: The quick brown fox jumps over the lazy dog -> This is not a perfect pangram
# Cheked with: abcdefghijklmnopqrstuvwxyz -> This is a perfect pangram
# Cheked with: Jock nymphs waqf drug vex blitz -> This is a perfect pangram
