#include <omp.h>

int n = 10;

double fun_mat1(double a[n][n], double b[n][n])
{
    int i, j, k;
    double aux, s = 0.0;
#pragma omp parallel private(j, k, aux) reduction(+ \
                                                  : s)
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            aux = 0.0;
            s += a[i][j];
            for (k = 0; k < n; k++)
            {
                aux += a[i][k] * a[k][j];
            }
            b[i][j] = aux;
        }
    }
    return s;
}

double fun_mat2(double a[n][n], double b[n][n])
{
    int i, j, k;
    double aux, s = 0.0;
    for (i = 0; i < n; i++)
    {
#pragma omp parallel for private(aux, k) reduction(+ \
                                                   : s)
        for (j = 0; j < n; j++)
        {
            aux = 0.0;
            s += a[i][j];
            for (k = 0; k < n; k++)
            {
                aux += a[i][k] * a[k][j];
            }
            b[i][j] = aux;
        }
    }
    return s;
}

double fun_mat3(double a[n][n], double b[n][n])
{
    int i, j, k;
    double aux, s = 0.0;
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            aux = 0.0;
            s += a[i][j];
#pragma omp parallel for private(aux, k) reduction(+:aux)
            for (k = 0; k < n; k++)
            {
                aux += a[i][k] * a[k][j];
            }
            b[i][j] = aux;
        }
    }
    return s;
}