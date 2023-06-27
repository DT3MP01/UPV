double prod(double v[], int n)
{
    double p = 1;
    int i;
#pragma omp parallel for reduction(* \
                                   : p)
    for (i = 0; i < n; i++)
        p *= v[i];
    return p;
}

double prod2(double v[], int n)
{
    double p = 1;
    int i;
#pragma omp parallel for
    for (i = 0; i < n; i++)
#pragma omp atomic
        p *= v[i];
    return p;
}