int cmp(int n, double x[], double y[], int z[])
{
    int i, v, equal = 0;
    double aux;
#pragma omp parallel for private(aux, v) reduction(+ \
                                                   : equal)
    for (i = 0; i < n; i++)
    {
        aux = x[i] - y[i];
        if (aux > 0)
            v = 1;
        else if (aux < 0)
            v = -1;
        else
            v = 0;
        z[i] = v;
        if (v == 0)
            equal++;
    }
    return equal;
}