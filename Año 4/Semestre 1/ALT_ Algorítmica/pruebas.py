t_gestion = [3, 10, 2, 6, 5]


def banco(t_gestion):
    resultado = sorted(t_gestion)
    n = len(t_gestion)
    permanencia = sum(t*(n-i) for i, t in enumerate(resultado))
    print(list(enumerate(resultado)), "este es el resultado")
    return resultado, permanencia


# print(banco(t_gestion))
# [(0, 2), (1, 3), (2, 5), (3, 6), (4, 10)] Este es el resultado
# ([2, 3, 5, 6, 10], 59)

v = [1, 2, 5, 10]
# v = valores de las monedas, Q = valor que se pretende alcanzar

# Maximiza el número de billetes y monedas a utilizar


def naive_greedy_change(v, Q):
    x = []
    for vi in v:
        print("Q/vi", Q/vi, "monedas de", vi)
        x.append(Q/vi)
        Q = Q % vi
        print(Q, "Q")
    return x

# print(naive_greedy_change(v, 11))
# Q/vi 11.0
# 0 Q
# Q/vi 0.0
# 0 Q
# Q/vi 0.0
# 0 Q
# Q/vi 0.0
# 0 Q
# [11.0, 0.0, 0.0, 0.0]

# Minimiza el número de billetes y monedas a utilizar
def greedy_change(v, Q):
    x = []
    for vi in sorted(v, reverse=True):
        print("Q/vi", Q/vi, "monedas de", vi)
        x.append(Q/vi)
        Q = Q % vi
        print(Q, "Q")
    return x

# print(greedy_change(v, 11))
# Q/vi 1.1 monedas de 10
# 1 Q
# Q/vi 0.2 monedas de 5
# 1 Q
# Q/vi 0.5 monedas de 2
# 1 Q
# Q/vi 1.0 monedas de 1
# 0 Q
# [1.1, 0.2, 0.5, 1.0]


C = [(1, 5), (1, 2), (3, 6), (4, 7), (6, 7)]
# C = [(23, 40), (12, 50), (4, 8), (10, 12), (20, 25)]
# print("sorted C = ", sorted(C, key=lambda x: x[1])) # Ordenado según instante de finalización


def seleccion_actividades(C):
    x = set()
    if len(C) > 0:
        t_prev = min(s for (s, t) in C)
        for (s, t) in sorted(C, key=lambda x: x[1]):
            print(x)
            if t_prev <= s:
                x.add((s, t))
                t_prev = t
    return x


# print(sorted(seleccion_actividades(C)))
# sorted C =  [(1, 2), (1, 5), (3, 6), (4, 7), (6, 7)]
# set()
# {(1, 2)}
# {(1, 2)}
# {(1, 2), (3, 6)}
# {(1, 2), (3, 6)}
# [(1, 2), (3, 6), (6, 7)]

def m(hor, min): return hor * 60 + min


P = [(m(18, 00), 126), (m(22, 30), 120), (m(16, 00), 90), (m(17, 00), 110), (m(20, 30), 140),
     (m(16, 30), 210), (m(19, 00), 95), (m(21, 00), 110), (m(18, 00), 110)]

# print("sorted P = ", sorted(P, key=lambda x: sum(x))) # Ordenado según instante de finalización


def seleccionar(P):
    x = set()
    if len(P) > 0:
        t_prev = min(s for (s, t) in P)
        for (s, t) in sorted(P, key=lambda x: sum(x)):
            print(x)
            if t_prev <= s:
                x.add((s, t))
                t_prev = t + s
    return x


# print("Las películas a ver son:", sorted(seleccionar(P)))
# sorted P =  [(960, 90), (1020, 110), (1080, 110), (990, 210), (1080, 126), (1140, 95), (1230, 140), (1260, 110), (1350, 120)]
# set()
# {(960, 90)}
# {(960, 90)}
# {(1080, 110), (960, 90)}
# {(1080, 110), (960, 90)}
# {(1080, 110), (960, 90)}
# {(1080, 110), (960, 90)}
# {(1080, 110), (960, 90), (1230, 140)}
# {(1080, 110), (960, 90), (1230, 140)}
# Las películas a ver son: [(960, 90), (1080, 110), (1230, 140)]

# Estrategia first fit - place item in first available bin
def binpacking(pesos, capacidad):
    print("capacidad", capacidad)
    cajas = []
    for peso in sorted(pesos, reverse=True):
        print("peso", peso)
        print(list(enumerate(cajas)), "cajasARRIBA")
        for pos, cap in enumerate(cajas):
            if peso <= cap:
                cajas[pos] -= peso
                print(list(enumerate(cajas)), "cajas")
                break
        else:
            cajas.append(capacidad-peso)
            print(list(enumerate(cajas)), "cajasABAJO")
    return len(cajas)


def empaquetar(pesos, tipos):
    if len(pesos) == 0:
        return (0, None)
    maxpeso = max(pesos)
    cajas_necesarias = [(binpacking(pesos, capacidad), capacidad, precio)
                        for (capacidad, precio) in tipos if maxpeso <= capacidad]
    print(cajas_necesarias, "cajas_necesarias")
    pvp, capacidad, unidades = min(((cantidad*precio, capacidad, cantidad)
                                    for (cantidad, capacidad, precio) in cajas_necesarias),
                                   default=(0, None, -1))
    # Calcula el mínimo PVP, ya que la función mínimo evalúa la primera tupla
    return unidades, capacidad, pvp


tipos = [(25, 3.5), (50, 6.8), (70, 9.3)]
W = [10, 30, 20, 40, 40, 30, 25, 25, 40]
print(sorted(W, reverse=True),
      "pesos ordenados de mayor a menor y", "w_total =", sum(W))
print(empaquetar(W, tipos))

# [40, 40, 40, 30, 30, 25, 25, 20, 10] pesos ordenados de mayor a menor y w_total = 260
# capacidad 50
# peso 40
# [] cajasARRIBA
# [(0, 10)] cajasABAJO
# peso 40
# [(0, 10)] cajasARRIBA
# [(0, 10), (1, 10)] cajasABAJO
# peso 40
# [(0, 10), (1, 10)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10)] cajasABAJO
# peso 30
# [(0, 10), (1, 10), (2, 10)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10), (3, 20)] cajasABAJO
# peso 30
# [(0, 10), (1, 10), (2, 10), (3, 20)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20)] cajasABAJO
# peso 25
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20), (5, 25)] cajasABAJO
# peso 25
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20), (5, 25)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20), (5, 0)] cajas
# peso 20
# [(0, 10), (1, 10), (2, 10), (3, 20), (4, 20), (5, 0)] cajasARRIBA
# [(0, 10), (1, 10), (2, 10), (3, 0), (4, 20), (5, 0)] cajas
# peso 10
# [(0, 10), (1, 10), (2, 10), (3, 0), (4, 20), (5, 0)] cajasARRIBA
# [(0, 0), (1, 10), (2, 10), (3, 0), (4, 20), (5, 0)] cajas
# capacidad 70
# peso 40
# [] cajasARRIBA
# [(0, 30)] cajasABAJO
# peso 40
# [(0, 30)] cajasARRIBA
# [(0, 30), (1, 30)] cajasABAJO
# peso 40
# [(0, 30), (1, 30)] cajasARRIBA
# [(0, 30), (1, 30), (2, 30)] cajasABAJO
# peso 30
# [(0, 30), (1, 30), (2, 30)] cajasARRIBA
# [(0, 0), (1, 30), (2, 30)] cajas
# peso 30
# [(0, 0), (1, 30), (2, 30)] cajasARRIBA
# [(0, 0), (1, 0), (2, 30)] cajas
# peso 25
# [(0, 0), (1, 0), (2, 30)] cajasARRIBA
# [(0, 0), (1, 0), (2, 5)] cajas
# peso 25
# [(0, 0), (1, 0), (2, 5)] cajasARRIBA
# [(0, 0), (1, 0), (2, 5), (3, 45)] cajasABAJO
# peso 20
# [(0, 0), (1, 0), (2, 5), (3, 45)] cajasARRIBA
# [(0, 0), (1, 0), (2, 5), (3, 25)] cajas
# peso 10
# [(0, 0), (1, 0), (2, 5), (3, 25)] cajasARRIBA
# [(0, 0), (1, 0), (2, 5), (3, 15)] cajas
# [(6 cajas, 50 kg, 6.8 €), (4 cajas, 70 kg, 9.3 €)] cajas_necesarias
# (4, 70, 37.2)
