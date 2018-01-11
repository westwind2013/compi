# 1 "./sendrecv.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./sendrecv.cil.c"
# 5 "sendrecv.c"
void __globinit_sendrecv(void) ;
extern void __CrestInit(void) __attribute__((__crest_skip__)) ;
extern void __CrestHandleReturn(int id , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestReturn(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestCall(int id , unsigned int fid ) __attribute__((__crest_skip__)) ;
extern void __CrestBranch(int id , int bid , unsigned char b ) __attribute__((__crest_skip__)) ;
extern void __CrestApply2(int id , int op , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestApply1(int id , int op , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestClearStack(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestStore(int id , unsigned long addr ) __attribute__((__crest_skip__)) ;
extern void __CrestLoad(int id , unsigned long addr , long long val ) __attribute__((__crest_skip__)) ;
# 96 "/usr/include/mpich/mpi.h"
typedef int MPI_Datatype;
# 265 "/usr/include/mpich/mpi.h"
typedef int MPI_Comm;
# 535 "/usr/include/mpich/mpi.h"
typedef long long MPI_Count;
# 559 "/usr/include/mpich/mpi.h"
struct MPI_Status {
   int MPI_SOURCE ;
   int MPI_TAG ;
   int MPI_ERROR ;
   MPI_Count count ;
   int cancelled ;
   int abi_slush_fund[2] ;
};
# 559 "/usr/include/mpich/mpi.h"
typedef struct MPI_Status MPI_Status;
# 842 "/usr/include/mpich/mpi.h"
extern int MPI_Send(void const *buf , int count , MPI_Datatype datatype , int dest ,
                    int tag , MPI_Comm comm ) ;
# 844 "/usr/include/mpich/mpi.h"
extern int MPI_Recv(void *buf , int count , MPI_Datatype datatype , int source , int tag ,
                    MPI_Comm comm , MPI_Status *status ) ;
# 846 "/usr/include/mpich/mpi.h"
extern int MPI_Get_count(MPI_Status const *status , MPI_Datatype datatype , int *count ) ;
# 992 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_size(MPI_Comm comm , int *size ) ;
# 993 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_rank(MPI_Comm comm , int *rank ) ;
# 1041 "/usr/include/mpich/mpi.h"
extern int MPI_Init(int *argc , char ***argv ) ;
# 1042 "/usr/include/mpich/mpi.h"
extern int MPI_Finalize(void) ;
# 202 "/home/westwind/myInstall/crest.mpi/bin/../include/crest.h"
extern void __CrestInt(int *x ) __attribute__((__crest_skip__)) ;
# 362 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 5 "sendrecv.c"
int main(int argc , char **argv )
{
  int numtasks ;
  int rank ;
  int dest ;
  int source ;
  int rc ;
  int count ;
  int tag ;
  char inmsg ;
  char outmsg ;
  MPI_Status Stat ;
  int a ;
  int b ;
  int c ;
  int __retres16 ;

  {
  __globinit_sendrecv();
  __CrestCall(2, 1);
  __CrestStore(1, (unsigned long )(& argc));
  __CrestLoad(3, (unsigned long )0, (long long )1);
  __CrestStore(4, (unsigned long )(& tag));
# 7 "sendrecv.c"
  tag = 1;
  __CrestLoad(5, (unsigned long )0, (long long )((char )'x'));
  __CrestStore(6, (unsigned long )(& outmsg));
# 8 "sendrecv.c"
  outmsg = (char )'x';
# 11 "sendrecv.c"
  MPI_Init(& argc, & argv);
  __CrestClearStack(7);
  __CrestLoad(8, (unsigned long )0, (long long )1140850688);
# 12 "sendrecv.c"
  MPI_Comm_size(1140850688, & numtasks);
  __CrestClearStack(9);
  __CrestLoad(10, (unsigned long )0, (long long )1140850688);
# 13 "sendrecv.c"
  MPI_Comm_rank(1140850688, & rank);
  __CrestClearStack(11);
  __CrestLoad(14, (unsigned long )(& rank), (long long )rank);
  __CrestLoad(13, (unsigned long )0, (long long )0);
  __CrestApply2(12, 12, (long long )(rank == 0));
# 15 "sendrecv.c"
  if (rank == 0) {
    __CrestBranch(15, 3, 1);
    __CrestLoad(21, (unsigned long )0, (long long )3);
    __CrestLoad(20, (unsigned long )(& a), (long long )a);
    __CrestApply2(19, 2, (long long )(3 * a));
    __CrestLoad(18, (unsigned long )0, (long long )2);
    __CrestApply2(17, 0, (long long )(3 * a + 2));
    __CrestStore(22, (unsigned long )(& b));
# 18 "sendrecv.c"
    b = 3 * a + 2;
    {
    __CrestLoad(25, (unsigned long )(& b), (long long )b);
    __CrestLoad(24, (unsigned long )0, (long long )8);
    __CrestApply2(23, 12, (long long )(b == 8));
# 19 "sendrecv.c"
    if (b == 8) {
      __CrestBranch(26, 5, 1);
# 20 "sendrecv.c"
      printf((char const * __restrict )"8\n");
      __CrestClearStack(28);
      __CrestLoad(29, (unsigned long )0, (long long )1);
      __CrestStore(30, (unsigned long )(& dest));
# 21 "sendrecv.c"
      dest = 1;
      __CrestLoad(31, (unsigned long )0, (long long )1);
      __CrestStore(32, (unsigned long )(& source));
# 22 "sendrecv.c"
      source = 1;
      __CrestLoad(33, (unsigned long )0, (long long )1);
      __CrestLoad(34, (unsigned long )0, (long long )1275068673);
      __CrestLoad(35, (unsigned long )(& dest), (long long )dest);
      __CrestLoad(36, (unsigned long )(& tag), (long long )tag);
      __CrestLoad(37, (unsigned long )0, (long long )1140850688);
# 23 "sendrecv.c"
      rc = MPI_Send((void const *)(& outmsg), 1, 1275068673, dest, tag, 1140850688);
      __CrestHandleReturn(39, (long long )rc);
      __CrestStore(38, (unsigned long )(& rc));
      __CrestLoad(40, (unsigned long )0, (long long )1);
      __CrestLoad(41, (unsigned long )0, (long long )1275068673);
      __CrestLoad(42, (unsigned long )(& source), (long long )source);
      __CrestLoad(43, (unsigned long )(& tag), (long long )tag);
      __CrestLoad(44, (unsigned long )0, (long long )1140850688);
# 24 "sendrecv.c"
      rc = MPI_Recv((void *)(& inmsg), 1, 1275068673, source, tag, 1140850688, & Stat);
      __CrestHandleReturn(46, (long long )rc);
      __CrestStore(45, (unsigned long )(& rc));
    } else {
      __CrestBranch(27, 6, 0);
# 26 "sendrecv.c"
      printf((char const * __restrict )"not 8\n");
      __CrestClearStack(47);
    }
    }
  } else {
    __CrestBranch(16, 7, 0);
    {
    __CrestLoad(50, (unsigned long )(& rank), (long long )rank);
    __CrestLoad(49, (unsigned long )0, (long long )1);
    __CrestApply2(48, 12, (long long )(rank == 1));
# 31 "sendrecv.c"
    if (rank == 1) {
      __CrestBranch(51, 8, 1);
      __CrestLoad(53, (unsigned long )0, (long long )0);
      __CrestStore(54, (unsigned long )(& dest));
# 32 "sendrecv.c"
      dest = 0;
      __CrestLoad(55, (unsigned long )0, (long long )0);
      __CrestStore(56, (unsigned long )(& source));
# 33 "sendrecv.c"
      source = 0;
# 36 "sendrecv.c"
      __CrestInt(& c);
      __CrestLoad(57, (unsigned long )0, (long long )1);
      __CrestLoad(58, (unsigned long )0, (long long )1275068673);
      __CrestLoad(59, (unsigned long )(& source), (long long )source);
      __CrestLoad(60, (unsigned long )(& tag), (long long )tag);
      __CrestLoad(61, (unsigned long )0, (long long )1140850688);
# 38 "sendrecv.c"
      rc = MPI_Recv((void *)(& inmsg), 1, 1275068673, source, tag, 1140850688, & Stat);
      __CrestHandleReturn(63, (long long )rc);
      __CrestStore(62, (unsigned long )(& rc));
      __CrestLoad(64, (unsigned long )0, (long long )1);
      __CrestLoad(65, (unsigned long )0, (long long )1275068673);
      __CrestLoad(66, (unsigned long )(& dest), (long long )dest);
      __CrestLoad(67, (unsigned long )(& tag), (long long )tag);
      __CrestLoad(68, (unsigned long )0, (long long )1140850688);
# 39 "sendrecv.c"
      rc = MPI_Send((void const *)(& outmsg), 1, 1275068673, dest, tag, 1140850688);
      __CrestHandleReturn(70, (long long )rc);
      __CrestStore(69, (unsigned long )(& rc));
    } else {
      __CrestBranch(52, 9, 0);

    }
    }
  }
  __CrestLoad(71, (unsigned long )0, (long long )1275068673);
# 42 "sendrecv.c"
  rc = MPI_Get_count((MPI_Status const *)(& Stat), 1275068673, & count);
  __CrestHandleReturn(73, (long long )rc);
  __CrestStore(72, (unsigned long )(& rc));
  __CrestLoad(74, (unsigned long )(& rank), (long long )rank);
  __CrestLoad(75, (unsigned long )(& count), (long long )count);
  __CrestLoad(76, (unsigned long )(& Stat.MPI_SOURCE), (long long )Stat.MPI_SOURCE);
  __CrestLoad(77, (unsigned long )(& Stat.MPI_TAG), (long long )Stat.MPI_TAG);
# 43 "sendrecv.c"
  printf((char const * __restrict )"Task %d: Received %d char(s) from task %d with tag %d \n",
         rank, count, Stat.MPI_SOURCE, Stat.MPI_TAG);
  __CrestClearStack(78);
# 46 "sendrecv.c"
  MPI_Finalize();
  __CrestClearStack(79);
  __CrestLoad(80, (unsigned long )0, (long long )0);
  __CrestStore(81, (unsigned long )(& __retres16));
# 47 "sendrecv.c"
  __retres16 = 0;
  __CrestLoad(82, (unsigned long )(& __retres16), (long long )__retres16);
  __CrestReturn(83);
# 5 "sendrecv.c"
  return (__retres16);
}
}
void __globinit_sendrecv(void)
{


  {
  __CrestInit();
}
}
