#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 1.1.- Pig Latin

"""
1.- Pig Latin

Nombre Alumno: David Arnal García
"""

import sys
import re
from pathlib import Path


class Translator():
    def __init__(self, punt=None):
        """
        :param punt(opt): cadena con signos de puntuación
        """

        if punt is None:
            punt = ".,;?!"
        self.re = re.compile(r"(\w+)([" + punt + r"]*)")

    def translate_word(self, word):
        """
        Esta función recibe una palabra en inglés y la traduce a Pig Latin

        :param word: la palabra que se debe pasar a Pig Latin
        :return: la palabra traducida
        """
        # COMPLETAR
        if word[0].isdigit():
            return word

        vowels = set('aeiouyAEIOUY')

        # Pig Latin algorithm
        def standard_algorithm(word):
            i = 0
            first_letter = word[0]

            while (not set(word[0]).issubset(vowels) and i < len(word)):
                # Deletes the first letter of the word
                word = word[1:]
                # Adds the first letter at the end
                word += first_letter
                # Updates the first letter
                first_letter = word[0]
                i += 1

            return word

        # Extracting symbols and updating string
        symbols = set('.,;?!')
        mySymbols = symbols.intersection(set(word))

        pattern = re.compile(r'(\W)')
        word = pattern.sub('', word)

        # Saving the format of the string
        format = 1
        if word.isupper():
            format = 2
        elif word[0].isupper():
            format = 3

        word = word.lower()

        # Defining the string processing
        def processing(word, vowel='yay', consonant='ay'):
            if set(word[0]).issubset(vowels):
                return word + vowel + ''.join(mySymbols)
            else:
                return standard_algorithm(word) + consonant + ''.join(mySymbols)

        # Processing string according to the format
        if format == 1:
            return processing(word)
        elif format == 2:
            return processing(word.upper(), 'YAY', 'AY')
        else:
            return processing(word).capitalize()

    def translate_sentence(self, sentence):
        """
        Esta función recibe una frase en inglés y la traduce a Pig Latin

        :param sentence: la frase que se debe pasar a Pig Latin
        :return: la frase traducida
        """
        # COMPLETAR
        mySentence = sentence.split()  # Removes (splits) spaces
        myList = list(map(lambda x: t.translate_word(x), mySentence))
        return ' '.join(myList)

    def translate_file(self, filename):
        """
        Recibe un fichero y crea otro con su tradución
        a Pig Latin

        :param filename: el nombre del fichero a traducir
        """
        # COMPLETAR
        # Checking if the file exists
        myPathFile = Path(filename)
        if not (myPathFile.is_file() and myPathFile.exists()):
            print(filename + " doesn't exist")
        else:
            # Writing lines in new file
            sentencePoint = sys.argv[1].find('.')
            with open(filename, 'r', encoding='UTF-8') as myOriginalFile:
                with open(filename[:sentencePoint] + '_latin' + filename[sentencePoint:], 'w', encoding='UTF-8') as myNewFile:
                    lines = myOriginalFile.readlines()
                    for line in lines:
                        myNewFile.writelines(t.translate_sentence(line) + '\n')


if __name__ == "__main__":
    if len(sys.argv) > 2:
        print(f'Syntax: py {sys.argv[0]} [filename]')
    else:
        t = Translator()
        # COMPLETAR
        if len(sys.argv) == 1:
            print('Please, write a string in English and I will translate it to Pig Latin. If you want to exit, press enter.')
            sentence = input('ENGLISH: ')
            while len(sentence) > 1:
                print('PIG LATIN: ' + t.translate_sentence(sentence))
                sentence = input('ENGLISH: ')
        else:
            t.translate_file(sys.argv[1])
