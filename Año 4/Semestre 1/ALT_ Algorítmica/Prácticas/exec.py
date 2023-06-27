










import os

os.system('py .\SAR_Indexer.py -S -P -M -O -U corpora/2015 2015_index_full.bin')
for i in range(1, 4):
    for dis in ["levenshtein"]:
        print("TH: %d" % i)
        print(dis)
        for word in ["alexanderx", "iluminaciónx", "capitla", "secuelax",
                     "asoman2", "virneg", "perwisos", "persimos", "limertad", "sagardo", 
                     "aperturaq", "loursed", "cuaqro", "planrta", "NOT antihéroes AND ecuador", 
                     "blindarse OR árboles AND perjuicio", "orígenes AND aversión", 
                     "actualmente AND NOT reubicar", "ventanasse OR rebuscar ",
                     "tortuosa OR atardecer", "NOT alexander AND iluminación",
                     "capital OR secuela AND asoman"]:
            os.system('py .\SAR_Searcher.py -C -Q "' + word +
                      '" -E -D ' + dis + ' -H ' + str(i) + ' 2015_index_full.bin')
