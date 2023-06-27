double f(double x[], double y[], double z[], int n)
{
    int i, j;
    double s1, s2, a, res;
#pragma omp parallel sections
    {
#pragma omp section
        {
            T1(x, n); /* Tarea T1 */
        }
#pragma omp section
        {
            T2(y, n); /* Tarea T2 */
        }
#pragma omp section
        {
            T3(z, n); /* Tarea T3 */
        }

#pragma omp sections
        {
#pragma omp section
            {
                /* Tarea T4 */
                for (i = 0; i < n; i++)
                {
                    s1 = 0;
                    for (j = 0; j < n; j++)
                        s1 += x[i] * y[i];
                    for (j = 0; j < n; j++)
                        x[i] *= s1;
                }
            }

#pragma omp section
            {
                /* Tarea T5 */
                for (i = 0; i < n; i++)
                {
                    s2 = 0;
                    for (j = 0; j < n; j++)
                        s2 += y[i] * z[i];
                    for (j = 0; j < n; j++)
                        z[i] *= s2;
                }
            }
        }
    }
        /* Tarea T6 */
        a = s1 / s2;
        res = 0;
        for (i = 0; i < n; i++)
            res += a * z[i];
    }