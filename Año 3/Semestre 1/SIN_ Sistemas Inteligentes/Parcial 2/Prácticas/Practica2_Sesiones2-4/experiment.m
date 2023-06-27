#!/usr/bin/octave -qf

if (nargin != 3)
  printf("Usage: ./experiment.m <data> <alphas> <betas>\n");
  exit(0);
end

# {"datos/OCR_14x14", "[0.1]", "[1000]"};
# ./experiment.m OCR_14x14 "[0.1 1 10 100 1000 10000 100000]" "[0.1 1 10 100 1000 10000 100000]"

arg_list = argv(); # Get arguments
data = arg_list{1}; # Get first argument (data)
as = str2num(arg_list{2}); # Get second argument (alphas)
bs = str2num(arg_list{3}); # Get third argument (betas)

load(data);
[N, L] = size(data); # Filas y Columnas
D = L - 1; # Obtensión de la dimensión

# ll -> Identificadores de clases
# C -> Número de clases
ll = unique(data(:, L));
C = numel(ll);

# Indicar a la función rand() qué semilla se va a utilizar
# para que siempre que se repita el experimento, mezcle
# los datos de la misma manera
rand("seed", 23);
# mezcla de los datos, que se guardan en la variable data
data = data(randperm(N), :);

# NTr -> Número de datos de entrenamiento
NTr = round(0.7 * N);

# M -> Número de muestras para el test
M = N - NTr;

# te -> Número de datos de test
te = data(NTr + 1:N, :);

printf("#      a        b   E   k Ete  Ete(%%) Intervalo(%%) \n");
printf("#------- -------- --- --- --- ------- -----------\n");

for a = as # a = [0.1 1 10 100 1000 10000 100000]
  for b = bs # b = [0.1 1 10 100 1000 10000 100000]
    # Llamada a perceptrón (dades entrenament, b, a, iteracions, iw=vector de pesos inicial)
    # w -> Vector de pesos entrenado
    # E -> Número de errores
    # k -> Número de iteraciones
    [w, E, k] = perceptron(data(1:NTr, :), b, a);

    # Creación de matriz a ceros
    rl = zeros(M, 1);

    # Recorrido de muestras y claficación
    # En r1 se tiene la clase de cada dato según las funciones entrenadas
    for n = 1:M
      # obtenemos la clase en la que se ha clasificado el dato
      rl(n) = ll(linmach(w, [1 te(n, 1:D)]'));
    end

    # Comprobamos que cada muestra está bien clasificada
    # m -> Esta matriz nos dice en qué clase se ha clasificado cada dato
    [nerr m] = confus(te(:, L), rl);

    # Número de errores / muestras de test
    perr = nerr / M; # Intervalo de confianza = m +- r

    # Intervalo de confianza al 95%
    s = sqrt(perr * (1 - perr) / M);
    r = 1.96 * s;

    # Normalización de resultados para su salida por pantalla
    pe = perr * 100;
    ies = (perr - r) * 100;
    idt = (perr+r) * 100;

    if (ies < 0) ies = 0; 
    else if (idt > 100) idt = 100

    end
    end

    printf("%8.1f %8.1f %3d %3d %3d      %1.1f [%1.1f, %1.1f]\n", a, b, E, k, nerr, pe, ies, idt);

    end

    printf("\n");
    end