#include <stdio.h>
#include <omp.h>
int main()
{
    int i, tid;
    unsigned int n, s = 0;
    scanf("%u", &n);
    omp_set_num_threads(6);
#pragma omp parallel for lastprivate(tid) reduction(+ \
                                                    : s) schedule(dynamic, 2)
    for (i = 1; i <= n; i++)
    {
        tid = omp_get_thread_num();
        s += i;
    }
    printf("El hilo que ha sumado el último número es %d\n", tid);