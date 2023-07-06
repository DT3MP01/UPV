


with open('out') as g:
    data = [line.strip().split() for line in g.readlines()]
    
    for line in data:
        line = [float(i) for i in line] 
        lista = line[::2] 
        lista = lista[1:]  # Eliminar el primer elemento
        print(lista.index(max(lista))+1)
       
                    
    
