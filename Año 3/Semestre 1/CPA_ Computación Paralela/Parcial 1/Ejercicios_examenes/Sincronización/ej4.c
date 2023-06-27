#include <math.h>
#define DIMN 100

double infNorm(double A[DIMN][DIMN], int n)
{
    int i, j;
    double s, norm = 0;
    #pragma omp parallel for private(s, j) // reduction (max : norm)
    for (i = 0; i < n; i++)
    {
        s = 0;
        for (j = 0; j < n; j++)
            s += fabs(A[i][j]);
        if (s > norm)
        #pragma omp critical
        if (s > norm)
            norm = s;
    }
    return norm;
}