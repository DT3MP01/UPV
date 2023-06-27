import re

from test_tarea2 import dp_levenshtein_threshold
from test_tarea2 import dp_restricted_damerau_threshold
from test_tarea2 import dp_intermediate_damerau_threshold
from test_tarea4 import dp_levenshtein_trie
from test_tarea4 import dp_restricted_damerau_trie
from test_tarea4 import dp_intermediate_damerau_trie

import math
import collections
import random
import numpy as np

from time import process_time
from trie import Trie


def measure_time(function, arguments):
    count, accum = 0, 0

    while accum < 0.1:
        prepare(*prepare_args)
        t_ini = process_time()
        returned_value = function(*arguments)
        accum += process_time() - t_ini
        count += 1

    return accum/count, returned_value


class SpellSuggesterTimes:
    """
    Clase que implementa el método suggest para la búsqueda de términos.
    """

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

    def __init__(self, vocab_file_path, n=10**1):
        """Método constructor de la clase SpellSuggester
        Construye una lista de términos únicos (vocabulario),
        que además se utiliza para crear un trie.
        Args:
            vocab_file (str): ruta del fichero de texto para cargar el vocabulario.
        """
        # build_vocab()
        tokenizer = re.compile(r"\W+")
        with open(vocab_file_path, "r", encoding='utf-8') as fr:
            c = collections.Counter(tokenizer.split(fr.read().lower()))
            if '' in c:
                del c['']
            reversed_c = [(freq, word) for (word, freq) in c.items()]
            sorted_reversed = sorted(reversed_c, reverse=True)
            sorted_vocab = [word for (freq, word) in sorted_reversed]

            self.full_vocab = sorted_vocab
            self.vocabulary = sorted_vocab[0:n]
        self.trie = Trie(sorted(self.vocabulary))
    # Aplica a cada palabra una conversion aleatoria

    def get_random_terms(self, n):
        custom_terms = random.choices(self.full_vocab, k=n)
        case = 0
        for j in range(6):
            for i in range(len(custom_terms)):
                case = random.randint(0, 3)
                word = list(custom_terms[i])
                # insertar x
                if case == 0 or len(word) == 1:
                    word.insert(random.randint(0, len(word)), "x")
                # borrar una palabra
                elif case == 1:
                    del word[random.randint(0, len(word)-1)]
                # intercambiar 2 palabras
                elif case == 2:
                    index = random.randint(0, len(word)-2)
                    word[index], word[index+1] = word[index+1],  word[index]

                custom_terms[i] = "".join(word)

        return custom_terms


if __name__ == "__main__":

    spellsuggester = SpellSuggesterTimes("./corpora/quijote.txt")
    words = spellsuggester.get_random_terms(10)


    distances = ["levenshtein", "restricted", "intermediate",
                 "levenshtein-trie", "restricted-trie", "intermediate-trie"]
    print(words)
    thres = [1, 2, 3, 4, 5]
    tallas = [200, 2000, 5000, 10000, 20000, 40000]

    results = {}
    for talla in tallas:
        results[talla] = {}
        spellsuggester = SpellSuggesterTimes("./corpora/quijote.txt", talla)
        for dist in distances:
            results[talla][dist] = {}
            for th in thres:
                results[talla][dist][th] = []
                for w in words:
                    # Including the content of the function measure_tieme here:
                    # tiempo, resultado = measure_time(spellsuggester.suggest, [w, dist, thres])
                    count, accum = 0, 0
                    while accum < 0.1:
                        t_ini = process_time()
                        spellsuggester.suggest(w, dist, th)
                        accum += process_time() - t_ini
                        count += 1
                    tiempo = accum/count
                    # end measure_time
                    results[talla][dist][th].append(tiempo)
                    # print("Palabra: " + str(w) + "Método: " + str(dist) + " Talla: " +
                    #         str(i)+" Treshold: " + str(t) + "Tiempo: "+str(tiempo))
    print("Computing finished")
    # CALCULOS (media, mediana y desviación típica)
    # Writing results to file
    for th in thres:
        with open("th= " + str(th) + 'tiempos.txt', "w", encoding='utf-8') as fw:
            fw.write("Palabras analizadas" + str(words) + "\n")
            fw.write("talla")
            for dist in distances:
                fw.write(" " + str(dist))
            for talla in tallas:
                fw.write("\n" + str(talla) + " ")
                for i, dist in enumerate(distances):
                    listaTiempos = results[talla][dist][th]
                    media = np.mean(listaTiempos)
                    # mediana = np.median(listaTiempos)
                    # desviacion = np.std(listaTiempos)
                    if i > 0:
                        fw.write(str(media) + " ")
                    else:
                        fw.write(str(media) + " ")
    print("Results in tiempos.txt")
