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

    def __init__(self, vocab_list):
        """Método constructor de la clase SpellSuggester

        Construye una lista de términos únicos (vocabulario),
        que además se utiliza para crear un trie.

        Args:
            vocab_list (str): vocabulario.

        """
        self.vocabulary = self.build_vocab(vocab_list)

    def build_vocab(self, vocab_list):
        """Método para crear el vocabulario.

        Se tokeniza por palabras el fichero de texto,
        se eliminan palabras duplicadas y se ordena
        lexicográficamente.

        Args:
            vocab_file (str): vocabulario.
        """
        vocab = set(vocab_list)
        vocab.discard('')  # por si acaso
        return sorted(vocab)

    def suggest(self, term, distance="levenshtein", threshold=3):
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
            results = function[distance](term, self.trie, threshold)
            # print(results)
        else:
            for vocab_term in self.vocabulary:
                if (abs(len(term) - len(vocab_term)) <= threshold):
                    dist = function[distance](term, vocab_term, threshold)
                    if dist <= threshold:
                        results[vocab_term] = dist

        return results


class TrieSpellSuggester(SpellSuggester):
    """
    Clase que implementa el método suggest para la búsqueda de términos y añade el trie

    """

    def __init__(self, vocab_list):
        super().__init__(vocab_list)
        self.trie = Trie(self.vocabulary)
