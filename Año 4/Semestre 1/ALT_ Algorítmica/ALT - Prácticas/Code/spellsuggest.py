# -*- coding: utf-8 -*-
import collections
import re
from collections import Counter
import numpy as np
import time


from trie import Trie

from test_tarea2 import dp_levenshtein_threshold
from test_tarea2 import dp_restricted_damerau_threshold
from test_tarea2 import dp_intermediate_damerau_threshold
from test_tarea4 import dp_levenshtein_trie
from test_tarea4 import dp_restricted_damerau_trie
from test_tarea4 import dp_intermediate_damerau_trie


class SpellSuggester:

    """
    Clase que implementa el método suggest para la búsqueda de términos.
    """

    def __init__(self, vocab_file_path):
        """Método constructor de la clase SpellSuggester

        Construye una lista de términos únicos (vocabulario),
        que además se utiliza para crear un trie.

        Args:
            vocab_file (str): ruta del fichero de texto para cargar el vocabulario.

        """

        self.vocabulary = self.build_vocab(
            vocab_file_path, tokenizer=re.compile("\W+"))

    def build_vocab(self, vocab_file_path, tokenizer):
        """Método para crear el vocabulario.

        Se tokeniza por palabras el fichero de texto,
        se eliminan palabras duplicadas y se ordena
        lexicográficamente.

        Args:
            vocab_file (str): ruta del fichero de texto para cargar el vocabulario.
            tokenizer (re.Pattern): expresión regular para la tokenización.
        """
        with open(vocab_file_path, "r", encoding='utf-8') as fr:
            vocab = set(tokenizer.split(fr.read().lower()))
            vocab.discard('')  # por si acaso
            return sorted(vocab)

    def suggest(self, term, distance="levenshtein", threshold=2):
        """Método para sugerir palabras similares siguiendo la tarea 3.
        Args:
            term (str): término de búsqueda.
            distance (str): algoritmo de búsqueda a utilizar
                {"levenshtein", "restricted", "intermediate"}.
            threshold (int): threshold para limitar la búsqueda
                puede utilizarse con los algoritmos de distancia mejorada de la tarea 2
                o filtrando la salida de las distancias de la tarea 2
        """
        assert distance in ["levenshtein", "restricted", "intermediate",
                            "levenshtein-trie", "restricted-trie", "intermediate-trie"]
        results = {}  # diccionario termino:distancia
        function = {
            "levenshtein": dp_levenshtein_threshold,
            "restricted": dp_restricted_damerau_threshold,
            "intermediate": dp_intermediate_damerau_threshold,
            "levenshtein-trie": dp_levenshtein_trie,
            "restricted-trie": dp_restricted_damerau_trie,
            "intermediate-trie": dp_intermediate_damerau_trie,
        }

        if distance in ["levenshtein-trie", "restricted-trie", "intermediate-trie"]:
            results = function[distance](term, spellsuggester.trie, threshold)
        else:
            for vocab_term in self.vocabulary:
                if (abs(len(term) - len(vocab_term)) <= threshold):
                    dist = function[distance](term, vocab_term, threshold)
                    if dist <= threshold:
                        results[vocab_term] = dist

        return results
    # s
    def suggest_opt(self, term, distance="levenshtein", threshold=2):
        """Método para sugerir palabras similares siguiendo la tarea 3.
                A completar.
                Args:
                    term (str): término de búsqueda.
                    distance (str): algoritmo de búsqueda a utilizar
                        {"levenshtein", "restricted", "intermediate"}.
                    threshold (int): threshold para limitar la búsqueda
                        puede utilizarse con los algoritmos de distancia mejorada de la tarea 2
                        o filtrando la salida de las distancias de la tarea 2
                """
        assert distance in ["levenshtein", "restricted", "intermediate",
                            "levenshtein-trie", "restricted-trie", "intermediate-trie"]
        results = {}  # diccionario termino:distancia
        function = {
            "levenshtein": dp_levenshtein_threshold,
            "restricted": dp_restricted_damerau_threshold,
            "intermediate": dp_intermediate_damerau_threshold,
            "levenshtein-trie": dp_levenshtein_trie,
            "restricted-trie": dp_restricted_damerau_trie,
            "intermediate-trie": dp_intermediate_damerau_trie,
        }

        if distance in ["levenshtein-trie", "restricted-trie", "intermediate-trie"]:
            results = function[distance](term, spellsuggester.trie, threshold)
        else:
            for vocab_term in self.vocabulary:
                if(distance == "levenshtein"):
                    # Calculating if the difference of the length of two words is less than the threshold
                    if (abs(len(term) - len(vocab_term)) <= threshold):
                        vocabulary = list(term + vocab_term)    
                        # casa y basa
                        # a b c s y
                        vx = dict.fromkeys(vocabulary)
                        vy = dict.fromkeys(vocabulary)

                        # Iterating both arrays and putting the amount of letters that appear in it
                        for l in vx:
                            vx[l] = term.count(l)
                            vy[l] = vocab_term.count(l)

                        # Substracting the letter, for check the deference of letters 
                        v = np.subtract(list(vx.values()), list(vy.values()))
                        
                        # Obtaining the result of the subtract, ensuring that the positive and negative values are correct in the result
                        dif = max(np.sum(v[v > 0]), -np.sum(v[v < 0]))
                        
                        if dif <= threshold:
                            dist = function[distance](
                                term, vocab_term, threshold)
                            if dist <= threshold:
                                results[vocab_term] = dist
                else:
                    if (abs(len(term) - len(vocab_term)) <= threshold):
                        dist = function[distance](term, vocab_term, threshold)
                        if dist <= threshold:
                            results[vocab_term] = dist
        return results

class TrieSpellSuggester(SpellSuggester):
    """
    Clase que implementa el método suggest para la búsqueda de términos y añade el trie

    """

    def __init__(self, vocab_file_path):
        super().__init__(vocab_file_path)
        self.trie = Trie(self.vocabulary)


if __name__ == "__main__":
    spellsuggester = TrieSpellSuggester("./corpora/quijote.txt")
    # res =spellsuggester.suggest('alexanderx',"levenshtein",1)
    # print(res)
    #for distance in ['levenshtein','restricted','intermediate']:
    for distance in ["levenshtein-trie", "restricted-trie", "intermediate-trie"]:
        destiny = f'result_{distance}_quijote.txt'
        with open(destiny, "w", encoding='utf-8') as fw:
            for palabra in ("casa", "senor", "jabón", "constitución", "ancho",
                            "savaedra", "vicios", "quixot", "s3afg4ew"):
                for threshold in range(1, 6):
                    resul = spellsuggester.suggest(
                        palabra, distance=distance, threshold=threshold)
                    numresul = len(resul)
                    #trie
                    resul = " ".join(sorted(f'{v}:{k}' for k, v in resul))
                    #normal
                    #resul = " ".join(sorted(f'{v}:{k}' for k,v in resul.items()))
                    fw.write(f'{palabra}\t{threshold}\t{numresul}\t{resul}\n')

    # spellsuggester.test(spellsuggester, "hola",2)
    # cuidado, la salida es enorme print(suggester.trie)
