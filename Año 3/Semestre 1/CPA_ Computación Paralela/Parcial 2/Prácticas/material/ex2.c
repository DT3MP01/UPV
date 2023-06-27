#include <stdio.h>
#include <mpi.h>

#define M 3
#define N 5

int filas_ceros(double A[M][N], int ceros[M])
{
    int media, parcial, total, i, j, cont;
    total = 0;

    int k, rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    k = M / size;

    MPI_Scatter(A, k * N, MPI_DOUBLE, A, k * N, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    for (i = 0; i < k; ++i)
    {
        parcial = 0;
        for (j = 0; j < N; ++j)
            if (A[i][j] == 0)
                ++parcial;
        ceros[i] = parcial;
        total += parcial;
    }

    media = total / k;
    cont = 0;
    for (i = 0; i < k; ++i)
        if (ceros[i] > media)
            ++cont;

    MPI_Reduce(&total, &total, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    MPI_Gather(ceros, k, MPI_DOUBLE, ceros, k, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    MPI_Reduce(&cont, &cont, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    return cont;
}