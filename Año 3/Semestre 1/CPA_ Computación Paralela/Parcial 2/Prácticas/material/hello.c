#include <stdio.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    int size;
    int rank;
    char name[MPI_MAX_PROCESSOR_NAME];
    int namelen;

    MPI_Init(&argc, &argv);

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Get_processor_name(name, &namelen);
    printf("Hello world from process %d of %d. Running on %s\n", rank, size, name);

    MPI_Finalize();
    return 0;
}