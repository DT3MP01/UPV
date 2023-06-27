"""
Ejercicio 4: Haz una función que simule de una manera "limitada" el comando
'grep' de Unix. La entrada de la función es:
• La ruta de un fichero de texto (que supondremos con encoding UTF-8)
• Una cadena de texto
La salida es una lista que contenga (en el mismo orden) todas las líneas del
fichero que contengan alguna ocurrencia de la cadena de texto recibida como
argumento.
Por ejemplo, si el fichero prueba.txt contiene:

hola, esta es la primera línea
la segunda línea del fichero prueba.txt
otra línea más
por fin termina este fichero de 4 líneas hola hola

La llamada:
funcion_grep('prueba.txt','la')

devolvería la lista:
["hola, esta es la primera línea",
"la segunda línea del fichero prueba.txt",
"por fin termina este fichero de 4 líneas hola hola"]

Observa que la última línea del fichero no contiene la palabra "la" pero sí la
ocurrencia de la subcadena "la" (forma parte de la palabra "hola").
"""

import string

print("This program simulates grep command behaviour")
route = input("Please, write the route of the text file: ")
text = input("Now write the text to be searched in the file: ")


def grepSimulator(file_route, toFind):
    with open(file_route, encoding='UTF-8') as file:
        lines = file.readlines()
        for line in lines:
            if toFind in line:
                print(line)


print('The lines that contain the searched content are: \n')
grepSimulator(route, text)
