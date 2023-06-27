"""
Ejercicio 5: Escribe una función char_freq() que toma una cadena y crea
una lista de frecuencias de los carácteres que figuran en el mismo. Representa
la frecuencia de carácteres con un diccionario Python. Prueba con algo como
char_freq("abbabcbdbabdbdbabababcbcbab").
Nota: Puedes utilizar la clase Counter del módulo collections
"""

import string
import collections


def char_freq(text):
    c = collections.Counter(text)
    print(c)
    for char in c:
        print('The frequency of ' + char + ' is: ' + str(c[char]))


phrase = input(
    'Write a string, and I will tell you the frequency of each character: ')
char_freq(phrase)
