double norma(double v[], int n)
{
    int i;
    double r = 0;

    #pragma omp parallel for reduction (+ : r)
    for (i = 0; i < n; i++)
    {
        r += v[i] * v[i];
    }

    return sqrt(r);
}