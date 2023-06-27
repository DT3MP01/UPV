#define N 10

double cuad_mat(double a[N][N], double b[N][N])
{
    int i, j, k;
    double aux, s = 0.0;
    #pragma omp parallel for private (j, k, aux) reduction (+:s)
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            aux = 0.0;
            for (k = i; k < N; k++)
                aux += a[i][k] * a[k][j];
            b[i][j] = aux;
            s += aux * aux;
        }
    }
    return s;
}