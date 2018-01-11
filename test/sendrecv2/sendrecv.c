#include "mpi.h"
#include "crest.h"
#include <stdio.h>

int main(int argc, char *argv[]) 
{
	int numtasks, rank, dest, source, rc, count, tag=1;  
	char inmsg, outmsg='x';
	MPI_Status Stat;

	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD, &numtasks);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
		int a, b;
		//CREST_int(a);
		b = 3 * a + 2;
		if (b == 8) {
			printf("8\n");
			dest = 1;
			source = 1;
			rc = MPI_Send(&outmsg, 1, MPI_CHAR, dest, tag, MPI_COMM_WORLD);
			rc = MPI_Recv(&inmsg, 1, MPI_CHAR, source, tag, MPI_COMM_WORLD, &Stat);
		} else {
			printf("not 8\n");
		}

	} 

	else if (rank == 1) {
		dest = 0;
		source = 0;

		int c;
		CREST_int(c);

		rc = MPI_Recv(&inmsg, 1, MPI_CHAR, source, tag, MPI_COMM_WORLD, &Stat);
		rc = MPI_Send(&outmsg, 1, MPI_CHAR, dest, tag, MPI_COMM_WORLD);
	}

	rc = MPI_Get_count(&Stat, MPI_CHAR, &count);
	printf("Task %d: Received %d char(s) from task %d with tag %d \n",
			rank, count, Stat.MPI_SOURCE, Stat.MPI_TAG);

	MPI_Finalize();
}
