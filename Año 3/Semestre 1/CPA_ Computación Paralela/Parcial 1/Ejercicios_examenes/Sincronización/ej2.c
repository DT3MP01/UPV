void f(int n, double v[], double x[], int ind[])
{
    int i;
    double aux;

#pragma omp parallel for private(aux)
    for (i = 0; i < n; i++)
    {
        aux = f2(v[i]);
        if (aux > x[ind[i]])
        {
#pragma omp critical
            if (aux > x[ind[i]])
            {
                x[ind[i]] = max(x[ind[i]], f2(v[i]));
            }
        }
    }
}