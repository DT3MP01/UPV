#define N 6000
#define PASOS 6
double funcion1(double A[N][N], double b[N], double x[N])
{
    int i, j, k, n = N, pasos = PASOS;
    double max = -1.0e308, q, s, x2[N];
    for (k = 0; k < pasos; k++)
    {
        q = 1;
        #pragma omp parallel for private (j, s) reduction (*:q)
        for (i = 0; i < n; i++)
        {
            s = b[i];
            for (j = 0; j < n; j++)
                s -= A[i][j] * x[j];
            x2[i] = s;
            q *= s;
        }
        for (i = 0; i < n; i++)
            x[i] = x2[i];
        if (max < q)
            max = q;
    }
    return max;
}