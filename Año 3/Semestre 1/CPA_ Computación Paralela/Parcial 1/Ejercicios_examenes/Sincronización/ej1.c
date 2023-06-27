int main()
{
    volatile int ordenado = 0;
    int i;
    int n = 50;
    double v[40];
    double a;

    int intercambios = 0;

    while (!ordenado)
    {
        ordenado = 1;
        #pragma omp parallel for private(a) reduction(+ : intercambios)
        for (i = 0; i < n - 1; i += 2)
        {
            if (v[i] > v[i + 1])
            {
                a = v[i];
                v[i] = v[i + 1];
                v[i + 1] = a;
                ordenado = 0;
                intercambios++;
            }
        }

        #pragma omp paraller for private(a) reduction(+ : intercambios)
        for (i = 1; i < n - 1; i += 2)
        {
            if (v[i] > v[i + 1])
            {
                a = v[i];
                v[i] = v[i + 1];
                v[i + 1] = a;
                ordenado = 0;
                intercambios++;
            }
        }
    }
}