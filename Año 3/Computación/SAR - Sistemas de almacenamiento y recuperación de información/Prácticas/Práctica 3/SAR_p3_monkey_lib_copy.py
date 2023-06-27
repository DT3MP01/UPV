#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 3.- Mono Library

import pickle
import random
import re
from collections import Counter

# Nombres:

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
        sentence = ['$'] + sentence + ['$']
        # Bigram words
        wordList = []
        # Creating all possible bigrams
        # I am trigram -> two pairs
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
            for i in range(len(sentence) - 2):
                myTrigram = sentence[i] + ' ' + \
                    sentence[i + 1] + ' ' + sentence[i + 2]
                wordList.append(myTrigram)
                myCounter = Counter(wordList)

            for key in myCounter:
                # Filling in the dictionary with the bigrams
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
        self.index = {'name': filename, "bi": {}}
        if tri:
            self.index["tri"] = {}
        #############
        # COMPLETAR #
        #############
        with open(filename, 'r', encoding='UTF-8') as myFile:
            bigramData = myFile.read().lower()
            bigramData = bigramData.replace("\n\n", ".")
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

    def generate_sentences(self, n=10, tri=True):
        #############
        # COMPLETAR #
        #############
        if tri:
            print(self.index["tri"])
            
        else:
            for _ in range(n):
                processingWord = self.generate_fromWord("$")
                text = processingWord
                i = 1
                while i < MAXIMUM_WORDS and processingWord != "$":
                    processingWord = self.generate_fromWord(processingWord)
                    if processingWord != "$":
                        text += ' ' + processingWord
                    i += 1
                print(text)

    def generate_fromWord(self, word, index="bi"):
        _, myList = self.index[index][word]
        numbers = []
        words = []
        for number, word in myList:
            numbers.append(number)
            words.append(word)
        return random.choices(words, weights=numbers, k=1)[0]


if __name__ == "__main__":
    print("Este fichero es una librería, no se puede ejecutar directamente")
