#include <stdio.h>
#include <mpi.h>

#define NR 3
#define NC 5

void calcular(double x[NR], double y[NR])
{
    double A[NR][NC], B[NR][NC];
    int n;
    int size;
    int rank;

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    task1(A, x, y);
    task2(B);
    n = task3(B, y);
    task4(x, B);
    task5(y, A, n);
}
