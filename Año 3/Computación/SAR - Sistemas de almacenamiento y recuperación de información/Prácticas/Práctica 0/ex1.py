""" Ejercicio 1
Un pangrama es una frase que contiene todas las letras del alfabeto
Inglés, al menos una vez. Escribe una función para comprobar si una cadena de texto recibida como
argumento es un pangrama o no. La función debe devolver un booleano.
Debes ignorar el hecho de usar mayúsculas o minúsculas.
"""

import string

alphabet = set(string.ascii_lowercase)
text = input("Write a pangram, and I will check if it is correct: ")
set_text = set("".join(text.lower().split()))

# print(alphabet)
# print(set_text)


def isPangram(phrase):
    answer = alphabet == set_text
    return answer


print(isPangram(input))

# Checked with: The quick brown fox jumps over the lazy dog
