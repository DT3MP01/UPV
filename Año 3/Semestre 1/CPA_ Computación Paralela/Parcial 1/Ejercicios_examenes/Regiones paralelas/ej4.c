#include <omp.h>

#define N 10

void normaliza(double A[N][N])
{
    int i, j;
    double suma = 0.0;
    double factor;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            suma = suma + A[i][j] * A[i][j];
        }
    }

    factor = 1.0 / sqrt(suma);

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            A[i][j] = factor * A[i][j];
        }
    }
}

void normaliza2regiones(double A[N][N])
{
    int i, j;
    double suma = 0.0;
    double factor;

#pragma omp parallel for private(j) reduction(+ \
                                              : suma)
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            suma = suma + A[i][j] * A[i][j];
        }
    }

    factor = 1.0 / sqrt(suma);

#pragma omp parallel for private(j)
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            A[i][j] = factor * A[i][j];
        }
    }
}

void normaliza1region(double A[N][N])
{
    int i;
    int j;
    double suma = 0.0;
    double factor;
#pragma omp parallel private(j)
    {
        #pragma omp for reduction (+ : suma)
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
            {
                suma = suma + A[i][j] * A[i][j];
            }
        }

        factor = 1.0 / sqrt(suma);

        #pragma omp for
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
            {
                A[i][j] = factor * A[i][j];
            }
        }
    }
}