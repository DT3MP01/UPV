int buscar(int x[], int n, int valor)
{
    int i;
    volatile int pos = -1;
    #pragma omp parallel for reduction (max:pos)
    for (i = 0; i < n; i++)
        if (x[i] == valor)
            pos = i;
    return pos;
}