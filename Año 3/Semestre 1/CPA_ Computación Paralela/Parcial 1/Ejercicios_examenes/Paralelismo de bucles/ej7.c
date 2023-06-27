#define EPS 1e-9
#define N 128
int fun(double a[N][N], double b[], double x[], int n, int nMax)
{
    int i, j, k;
    double err = 100, aux[N];
    
    for (i = 0; i < n; i++)
        aux[i] = 0.0;
    #pragma omp parallel for private (i, j) reduction (+:err)
    for (k = 0; k < nMax && err > EPS; k++)
    {
        err = 0.0;
        for (i = 0; i < n; i++)
        {
            x[i] = b[i];
            for (j = 0; j < i; j++)
                x[i] -= a[i][j] * aux[j];
            for (j = i + 1; j < n; j++)
                x[i] -= a[i][j] * aux[j];
            x[i] /= a[i][i];
            err += fabs(x[i] - aux[i]);
        }
        for (i = 0; i < n; i++)
            aux[i] = x[i];
    }
    return k < nMax;
}