#include <omp.h>
#include <math.h>
#include <stdio.h>

void f(int n, double a[], double b[])
{
    int i;
    int n_hilo;
    int n_hilos;
    int iter;

#pragma omp parallel 
{
    n_hilos = omp_get_num_threads();
    n_hilo = omp_get_thread_num();
}

#pragma omp parallel for private(iter)
    iter = 0;
    for (i = 0; i < n; i++)
    {
        b[i] = cos(a[i]);
        iter++;
    }

    printf("Hilo %d: %d iteraciones procesadas\n",
           n_hilo, iter);
}