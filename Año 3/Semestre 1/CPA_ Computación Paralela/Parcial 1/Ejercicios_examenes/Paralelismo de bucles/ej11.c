#define N 10

double f(double A[N][N], double B[N][N], double vs[N], double bmin)
{
    int i, j;
    double x, y, aux, stot = 0;
    #pragma omp parallel for private (j, aux, x, y) reduction (+ : stot)
    for (i = 0; i < N; i++)
    {
        aux = 0;
        #pragma omp parallel private (x) reduction (+:aux) nowait
        for (j = 0; j < N; j++)
        {
            x = A[i][j] * A[i][j] / 2.0;
            A[i][j] = x;
            aux += x;
        }

        #pragma omp parallel private (y)
        for (j = i; j < N; j++)
        {
            if (B[i][j] < bmin)
                y = bmin;
            else
                y = B[i][j];
            B[i][j] = 1.0 / y;
        }
        vs[i] = aux;
        stot += vs[i];
    }
    return stot;
}