#include <omp.h>

int M = 20;
int N = 20;

double funcion(double A[M][N])
{
    int i, j;
    double suma;
    #pragma omp parallel private(j)
    for (i = 0; i < M - 1; i++)
    {
        for (j = 0; j < N; j++)
        {
            A[i][j] = 2.0 * A[i + 1][j];
        }
    }
    suma = 0.0;

    #pragma omp parallel for (private j) reduction (+:suma)
    for (i = 0; i < M; i++)
    {
        for (j = 0; j < N; j++)
        {
            suma = suma + A[i][j];
        }
    }
    return suma;
}