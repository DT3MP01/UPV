#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 3.- Mono Library

import pickle
import random
import re
from collections import Counter

# Nombres:  David Arnal García
#           Luis Alberto Álvarez Zavaleta

########################################################################
########################################################################
###                                                                  ###
###  Todos los métodos y funciones que se añadan deben documentarse  ###
###                                                                  ###
########################################################################
########################################################################


def sort_index(d):
    for k in d:
        l = sorted(((y, x) for x, y in d[k].items()), reverse=True)
        d[k] = (sum(x for x, _ in l), l)


MAXIMUM_WORDS = 25


class Monkey():

    def __init__(self):
        self.r1 = re.compile('[^.;?!]+')
        self.r2 = re.compile('\w+')

    def index_sentence(self, sentence, tri):
        """
        Method that preprocesses a string and parses it by bigrams or trigrams.

        Parameters:
            sentence (str): String to parse.
            tri (bool): Trigram parsing or bigram parsing, otherwise.
        """
        sentence = ['$'] + sentence + ['$']
        # Bigram words
        wordList = []
        # Creating all possible bigrams
        for i in range(len(sentence) - 1):
            myBigram = sentence[i] + ' ' + sentence[i + 1]
            wordList.append(myBigram)
            myCounter = Counter(wordList)

        for key in myCounter:
            # Filling in the dictionary with the bigrams
            myBigram = key.split(' ')
            if myBigram[0] in self.index['bi']:
                if myBigram[1] in self.index['bi'][myBigram[0]]:
                    self.index['bi'][myBigram[0]
                                     ][myBigram[1]] += myCounter[key]
                else:
                    self.index['bi'][myBigram[0]].update(
                        {myBigram[1]: myCounter[key]})
            else:
                self.index['bi'][myBigram[0]] = {myBigram[1]: myCounter[key]}

        if tri:
            wordList = []
            # Creating all possible trigrams
            for i in range(len(sentence) - 2):
                myTrigram = sentence[i] + ' ' + \
                    sentence[i + 1] + ' ' + sentence[i + 2]
                wordList.append(myTrigram)
                myCounter = Counter(wordList)

            for key in myCounter:
                # Filling in the dictionary with the trigrams
                myTrigram = key.split(' ')
                myTuple = (myTrigram[0], myTrigram[1])

                if myTuple in self.index['tri']:
                    if myTrigram[2] in self.index['tri'][myTuple]:
                        self.index['tri'][myTuple][myTrigram[2]
                                                   ] += myCounter[key]
                    else:
                        self.index['tri'][myTuple].update(
                            {myTrigram[2]: myCounter[key]})
                else:
                    self.index['tri'][myTuple] = {
                        myTrigram[2]: myCounter[key]}

    def compute_index(self, filename, tri):
        """
        Method that obtains the bigrams, or bigrams and trigrams of a text file.

        Parameters:
            filename (str): filename of the file.
            tri (bool): Get bigrams and trigrams or only bigrams, otherwise.
        """
        self.index = {'name': filename, "bi": {}}
        if tri:
            self.index["tri"] = {}
        #############
        # COMPLETAR #
        #############
        with open(filename, 'r', encoding='UTF-8') as myFile:
            bigramData = myFile.read().lower().replace("\n\n", ".")
            bigramData = self.r1.findall(bigramData)

            for raw_sentence in bigramData:
                filtered_sentence = self.r2.findall(raw_sentence)
                if filtered_sentence:
                    self.index_sentence(filtered_sentence, tri)

            sort_index(self.index['bi'])
            if tri:
                sort_index(self.index['tri'])

    def load_index(self, filename):
        with open(filename, "rb") as fh:
            self.index = pickle.load(fh)

    def save_index(self, filename):
        with open(filename, "wb") as fh:
            pickle.dump(self.index, fh)

    def save_info(self, filename):
        with open(filename, "w") as fh:
            print("#" * 20, file=fh)
            print("#" + "INFO".center(18) + "#", file=fh)
            print("#" * 20, file=fh)
            print("filename: '%s'\n" % self.index['name'], file=fh)
            print("#" * 20, file=fh)
            print("#" + "BIGRAMS".center(18) + "#", file=fh)
            print("#" * 20, file=fh)
            for word in sorted(self.index['bi'].keys()):
                wl = self.index['bi'][word]
                print("%s\t=>\t%d\t=>\t%s" % (word, wl[0], ' '.join(
                    ["%s:%s" % (x[1], x[0]) for x in wl[1]])), file=fh)
            if 'tri' in self.index:
                print(file=fh)
                print("#" * 20, file=fh)
                print("#" + "TRIGRAMS".center(18) + "#", file=fh)
                print("#" * 20, file=fh)
                for word in sorted(self.index['tri'].keys()):
                    wl = self.index['tri'][word]
                    print("%s\t=>\t%d\t=>\t%s" % (word, wl[0], ' '.join(
                        ["%s:%s" % (x[1], x[0]) for x in wl[1]])), file=fh)

    def generate_sentences(self, n=10):
        """
        Method that generates a given number of random sentences.

        Parameters:
            n (int) (default: 10): Number of sentences to generate.
        """
        #############
        # COMPLETAR #
        #############
        if 'tri' in self.index:
            for _ in range(n):
                myList = []
                myWeights = []
                # Searching through the dictionary of tri and
                # finding the tuples of keys that have '$' as their first element.
                for keyTuple in self.index["tri"]:
                    first, _ = keyTuple
                    repetitions, _ = self.index["tri"][keyTuple]
                    if first == "$":
                        myList.append(keyTuple)
                        myWeights.append(repetitions)
                # Selecting a random tuple using the weights
                processingWords = random.choices(myList, weights=myWeights, k=1)[0]
                # Adding the first two words of the tuple to the text
                text = processingWords[1]
                processingWords = (
                    text, self.generate_fromWord(processingWords, "tri"))
                text += ' ' + processingWords[1]
                
                # Adding the rest until MAXIMUM_WORDS or the next word is '$'
                i = 2
                nextWord = ''
                while i < MAXIMUM_WORDS and nextWord != '$':
                    nextWord = self.generate_fromWord(processingWords, "tri")
                    if nextWord != '$':
                        text += ' ' + nextWord
                        processingWords = (processingWords[1], nextWord)
                    i += 1
                print(text)
        else:
            for _ in range(n):
                # Adding the first word of the tuple to the text
                processingWord = self.generate_fromWord("$")
                text = processingWord
                i = 1
                # Adding the rest until MAXIMUM_WORDS or the next word is '$'
                while i < MAXIMUM_WORDS and processingWord != "$":
                    processingWord = self.generate_fromWord(processingWord)
                    if processingWord != "$":
                        text += ' ' + processingWord
                    i += 1
                print(text)

    def generate_fromWord(self, key, index="bi"):
        """
        Method that returns a random key.

        Parameters:
            key (str or tuple): key of the dictionary depending on index.
            index (str) (default: 'bi'): 'bi' or 'tri', depending on the dictionary to look up.
            
        Returns:
            str: Chosen word.
        """
        _, myList = self.index[index][key]
        numbers = []
        words = []
        for number, key in myList:
            numbers.append(number)
            words.append(key)
        return random.choices(words, weights=numbers, k=1)[0]


if __name__ == "__main__":
    print("Este fichero es una librería, no se puede ejecutar directamente")
