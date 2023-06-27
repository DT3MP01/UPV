int n = 10;

double fun_mat(double a[n][n], double b[n][n])
{
    int i, j, k;
    double aux, s = 0.0;
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