#!/usr/bin/env python
#! -*- encoding: utf8 -*-

# Nombres:
# David Arnal García
# Luis Alberto Álvarez Zavaleta

########################################################################
########################################################################
###                                                                  ###
###  Todos los métodos y funciones que se añadan deben documentarse  ###
###                                                                  ###
########################################################################
########################################################################

import argparse
import re
from pathlib import Path
from collections import Counter


def sort_dic_by_values(d, asc=True):
    return sorted(d.items(), key=lambda a: (-a[1], a[0]))


class WordCounter:
    def __init__(self):
        """
           Constructor de la clase WordCounter
        """
        self.clean_re = re.compile(r'\w+')

    def write_stats(self, filename, stats, use_stopwords, full):
        """
        Este método escribe en fichero las estadísticas de un texto

        :param
            filename: el nombre del fichero destino.
            stats: las estadísticas del texto.
            use_stopwords: booleano, si se han utilizado stopwords
            full: boolean, si se deben mostrar las stats completas

        :return: None
        """

        def writingByFrequency(mySymbols, myStat):
            """
            Este método escribe en fichero los strings ordenados por frecuencias

            :param
                mySymbols: lista de símbolos ordenados
                myStat: string que identifica la variable de stat a almacenar
            :return: None
            """

            size = len(stats[myStat].keys())

            if not full and size > 20:
                size = 20

            i = 0
            while i < size:
                symbols, num = mySymbols[i]
                myNewFile.write('\t' + str(symbols) + ': ' + str(num) + '\n')
                i += 1

        def writingAlphabetically(myStat):
            """
            Este método escribe en fichero los strings ordenados alfabéticamente

            :param
                myStat: string que identifica la variable de stat a almacenar
            :return: None
            """
            
            size = len(stats[myStat].keys())

            if not full and size > 20:
                size = 20

            sortedWords = sorted(
                stats[myStat].keys(), key=lambda x: x)

            i = 0
            while i < size:
                myNewFile.write('\t' + str(sortedWords[i]) + ': ' +
                                str(stats[myStat][sortedWords[i]]) + '\n')
                i += 1

        # Writing stats
        with open(filename, 'w', encoding='UTF-8') as myNewFile:
            myNewFile.write('Lines: ' + str(stats["nlines"]) + '\n')
            myNewFile.write('Number of words (including stopwords): ' +
                            str(stats["nwords"]) + '\n')

            if use_stopwords:
                myNewFile.write('Number of words (without stopwords): ' +
                                str(stats["stopnwords"]) + '\n')

            myNewFile.write('Vocabulary size: ' +
                            str(stats["nvocabulary"]) + '\n')
            myNewFile.write('Number of symbols: ' +
                            str(stats["nsymbols"]) + '\n')
            myNewFile.write('Number of different symbols: ' +
                            str(stats["ndifferentsymbols"]) + '\n')

            myNewFile.write('Words (alphabetical order):' + '\n')
            sortedWords = sorted(stats['word'].keys(), key=lambda x: x)
            writingAlphabetically('word')

            myNewFile.write('Words (by frequency):' + '\n')
            sortedWords = sort_dic_by_values(stats['word'])
            writingByFrequency(sortedWords, 'word')

            myNewFile.write('Symbols (alphabetical order):' + '\n')
            writingAlphabetically('symbol')

            myNewFile.write('Symbols (by frequency):' + '\n')
            sortedSymbols = sort_dic_by_values(stats['symbol'])
            writingByFrequency(sortedSymbols, 'symbol')

            if "biword" in stats:
                myNewFile.write('Word pairs (alphabetical order):' + '\n')
                writingAlphabetically('biword')

                myNewFile.write('Word pairs (by frequency):' + '\n')
                sortedSymbols = sort_dic_by_values(stats['biword'])
                writingByFrequency(sortedSymbols, 'biword')

                myNewFile.write('Symbol pairs (alphabetical order):' + '\n')
                writingAlphabetically('bisymbol')

                myNewFile.write('Symbol pairs (by frequency):' + '\n')
                sortedSymbols = sort_dic_by_values(stats['bisymbol'])
                writingByFrequency(sortedSymbols, 'bisymbol')

    def file_stats(self, filename, lower, stopwordsfile, bigrams, full):
        """
        Este método calcula las estadísticas de un fichero de texto

        :param
            filename: el nombre del fichero.
            lower: booleano, se debe pasar todo a minúsculas?
            stopwordsfile: nombre del fichero con las stopwords o None si no se aplican
            bigram: booleano, se deben calcular bigramas?
            full: booleano, se deben montrar la estadísticas completas?

        :return: None
        """
        # Checking if stopwords file exists
        if stopwordsfile:
            myStopwordsPath = Path(stopwordsfile)
            if not (myStopwordsPath.is_file() and myStopwordsPath.exists()):
                print(stopwordsfile + " doesn't exist")
                exit()

        stopwords = [] if stopwordsfile is None else open(
            stopwordsfile, encoding='UTF-8').read().split()

        # variables for results

        sts = {
            'nlines': 0,
            'nwords': 0,
            'nvocabulary': 0,
            'nsymbols': 0,
            'ndifferentsymbols': 0,
            'word': {},
            'symbol': {},
        }
        if stopwords:
            sts['stopnwords'] = 0
        if bigrams:
            sts['biword'] = {}
            sts['bisymbol'] = {}

        myPathFile = Path(filename)
        if myPathFile.is_file() and myPathFile.exists():
            with open(filename, 'r', encoding='UTF-8') as myFile:
                myWords = myFile.read()

                if lower:
                    myWords = myWords.lower()
                if bigrams:
                    bigramData = myWords

                # Counting file lines
                pattern = re.compile(r'\n')
                sts["nlines"] = len(pattern.findall(myWords))

                # Counting words file
                myWords = self.clean_re.findall(myWords)
                sts["nwords"] = len(myWords)

                # Deleting stopwords
                if stopwords:
                    pattern = re.compile(
                        r'\b(' + r'|'.join(stopwords) + r')\b\s*')
                    myWords = pattern.sub('', ' '.join(myWords))
                    myWords = self.clean_re.findall(myWords)
                    sts["stopnwords"] = len(myWords)

                # To append $ to each line
                if bigrams:
                    bigramStopword = ['$']
                    for line in bigramData.split('\n'):
                        # To discard empty lines
                        line = self.clean_re.findall(line)
                        if line:
                            for word in line:
                                bigramStopword.append(word)
                            bigramStopword.append('$')

                # Counting vocabulary size
                sts["nvocabulary"] = len(set(myWords))

                mySymbols = ''.join(myWords)

                # Counting symbols in the file
                sts["nsymbols"] = len(mySymbols)

                # Counting different symbols in the file
                sts["ndifferentsymbols"] = len(set(mySymbols))

                # Counting the frequency of the words
                sts["word"] = Counter(myWords)

                # Counting the frequency of the symbols
                sts["symbol"] = Counter(mySymbols)

                # Bigram analysis
                if bigrams:
                    # Bigram words
                    wordList = []
                    for i in range(len(bigramStopword) - 1):
                        if not bigramStopword[i] in stopwords and not bigramStopword[i + 1] in stopwords:
                            myBigram = bigramStopword[i] + \
                                ' ' + bigramStopword[i + 1]
                            wordList.append(myBigram)
                    sts["biword"] = Counter(wordList)

                    # Bigram symbols
                    symbolList = []
                    i = 0
                    for word in bigramStopword:
                        if word not in stopwords:
                            word_letters = list(word)
                            for i in range(len(word_letters) - 1):
                                myBigram = word_letters[i] + \
                                    word_letters[i + 1]
                                symbolList.append(myBigram)
                    sts["bisymbol"] = Counter(symbolList)

                code = ''
                if lower:
                    code += 'l'
                if stopwords:
                    code += 's'
                if bigrams:
                    code += 'b'
                if full:
                    code += 'f'

                sentencePoint = filename.rfind('.')
                new_filename = filename[:sentencePoint] + '_' + \
                    code + '_stats' + filename[sentencePoint:]
                self.write_stats(new_filename, sts,
                                 stopwordsfile is not None, full)
        else:
            print(filename + " doesn't exist")

    def compute_files(self, filenames, **args):
        """
        Este método calcula las estadísticas de una lista de ficheros de texto

        :param
            filenames: lista con los nombre de los ficheros.
            args: argumentos que se pasan a "file_stats".

        :return: None
        """

        for filename in filenames:
            self.file_stats(filename, **args)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Compute some statistics from text files.')
    parser.add_argument('file', metavar='file', type=str, nargs='+',
                        help='text file.')

    parser.add_argument('-l', '--lower', dest='lower',
                        action='store_true', default=False,
                        help='lowercase all words before computing stats.')

    parser.add_argument('-s', '--stop', dest='stopwords', action='store',
                        help='filename with the stopwords.')

    parser.add_argument('-b', '--bigram', dest='bigram',
                        action='store_true', default=False,
                        help='compute bigram stats.')

    parser.add_argument('-f', '--full', dest='full',
                        action='store_true', default=False,
                        help='show full stats.')

    args = parser.parse_args()
    wc = WordCounter()

    wc.compute_files(args.file,
                     lower=args.lower,
                     stopwordsfile=args.stopwords,
                     bigrams=args.bigram,
                     full=args.full)
