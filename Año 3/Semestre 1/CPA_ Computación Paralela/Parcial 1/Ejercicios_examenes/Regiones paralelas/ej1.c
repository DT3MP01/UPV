#include <omp.h>

int busqueda(int x[], int n, int valor)
{
    int encontrado = 0, i = 0;
    while (!encontrado && i < n)
    {
        if (x[i] == valor)
            encontrado = 1;
        i++;
    }
    return encontrado;
}

int busqueda_paralelizada(int x[], int n, int valor)
{
    volatile int encontrado = 0;
    int i;
    int salto;

    while (!encontrado && i < n)
    {
        i = omp_get_thread_num();
        salto = omp_get_num_threads();

        if (x[i] == valor) {
            encontrado = 1;
        } else {
            i += salto;
        }
    }

    return encontrado;
}