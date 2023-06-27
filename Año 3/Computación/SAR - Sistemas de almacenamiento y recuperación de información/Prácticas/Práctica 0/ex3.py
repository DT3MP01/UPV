"""
Una cadena es anagrama de otra si contiene las mismas letras (y
para cada letra el mismo número de veces) que la otra cadena.

Por ejemplo, la cadenas “Life on mars” es un anagrama de “alien forms”.

Hay que eliminar los espacios y símbolos de puntuación antes de ver que ambas
cadenas tienen exactamente las mismas letras (sin importar el orden).

Observa que si conviertes las cadenas a conjunto (set) no es correcto porque
no tiene en cuenta si una letra aparece más de una vez.
"""

import string
import collections

print("Write two phrases, and I will check if they are anagrams")
text1 = input("Write the first phrase: ")
text2 = input("Write the second phrase: ")


def stripString(text):
    return "".join(text.lower().split())


def areAngrams(phrase):
    c1 = collections.Counter(stripString(text1))
    c2 = collections.Counter(stripString(text2))
    answer = c1 == c2
    return answer


print(areAngrams(input))

# Checked with: 'Life on mars' and 'Alien forms'
# Checked with: 'Tar' and 'rat'
# Checked with: 'Elbow' and 'Below'
# Checked with: 'School master' and 'The classroom'
# Checked with: 'Conversation' and 'Voices rant on'
# Checked with: 'Astronomer' and 'Moon starer'
