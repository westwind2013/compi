#include <mpi.h>
#include <stdio.h>
#include <crest.h>

int main(int argc, char** argv) {

    // Get the rank of the process
    int world_rank;
    int a;
    // Get the number of processes
    int world_size;
    MPI_Init(NULL, NULL);

    COMPI_int_with_limit(a, 100);
    
    int b = a + 1;
    a ++;
    
    // Initialize the MPI environment
    //MPI_Init(NULL, NULL);

    //CREST_world_size(world_size);
    //CREST_rank(world_rank);

    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    // Get the name of the processor
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;
    MPI_Get_processor_name(processor_name, &name_len);

    // Print off a hello world message
    printf("Hello world from processor %s, rank %d"
            " out of %d processors\n",
            processor_name, world_rank, world_size);


    if (1 == world_size) printf("world size: %d\n", world_size);
    else printf("world size: %d\n", world_size);


    if (1 < world_rank) printf("a1:s\n");
    else printf("a2:s\n");

    if (2 == 2*a) printf("b1:s\n");
    else printf("b2:s\n");

    fflush(stdout);
    // Finalize the MPI environment.
    MPI_Finalize();
}

