#include <stdio.h>
#include <mpi.h>

#define N 5

void comunica (double A[N][N], double B[N][N])
{
    MPI_Datatype slash;
    MPI_Type_vector(N - 1, 2, N + 1, MPI_DOUBLE, &slash);
    MPI_Type_commit(&slash);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    MPI_Sendrecv(&A[1][0], 1, slash, 1, 11, B, 1, slash, 0, 11, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    MPI_Type_free(&slash);
}