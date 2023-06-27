#include <omp.h>

#define N 10
#define M 20

double ej(double x[M], double y[N], double A[M][N])
{
    int i, j;
    double aux, s = 0.0;
#pragma omp parallel
    {
        #pragma omp for nowait
        for (i = 0; i < M; i++) 
        {
            x[i] = x[i] * x[i];
        }
        
        #pragma omp for
        for (i = 0; i < N; i++)
        {
            y[i] = 1.0 + y[i];
        }

        #pragma omp for reduction(+ : s) private(j, aux)
        for (i = 0; i < M; i++)
        {
            for (j = 0; j < N; j++)
            {
                aux = x[i] - y[j];
                A[i][j] = aux;
                s += aux;
            }
        }
    }
    return s;
}