# 1 "./mpi_comm.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./mpi_comm.cil.c"
# 12 "mpi_comm.c"
void __globinit_mpi_comm(void) ;
extern void __CrestInit(void) __attribute__((__crest_skip__)) ;
extern void __CrestGetMPIInfo(void) __attribute__((__crest_skip__)) ;
extern void __CrestWorldSize(unsigned long addr ) __attribute__((__crest_skip__)) ;
extern void __CrestRank(unsigned long addr ) __attribute__((__crest_skip__)) ;
extern void __CrestBranchOnly(int bid ) __attribute__((__crest_skip__)) ;
# 211 "/usr/lib/gcc/x86_64-linux-gnu/4.4.7/include/stddef.h"
typedef unsigned long size_t;
# 131 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __off_t;
# 132 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __off64_t;
# 139 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __time_t;
# 75 "/usr/include/time.h"
typedef __time_t time_t;
# 44 "/usr/include/stdio.h"
struct _IO_FILE;
# 44 "/usr/include/stdio.h"
struct _IO_FILE;
# 48 "/usr/include/stdio.h"
typedef struct _IO_FILE FILE;
# 144 "/usr/include/libio.h"
struct _IO_FILE;
# 154 "/usr/include/libio.h"
typedef void _IO_lock_t;
# 160 "/usr/include/libio.h"
struct _IO_marker {
   struct _IO_marker *_next ;
   struct _IO_FILE *_sbuf ;
   int _pos ;
};
# 245 "/usr/include/libio.h"
struct _IO_FILE {
   int _flags ;
   char *_IO_read_ptr ;
   char *_IO_read_end ;
   char *_IO_read_base ;
   char *_IO_write_base ;
   char *_IO_write_ptr ;
   char *_IO_write_end ;
   char *_IO_buf_base ;
   char *_IO_buf_end ;
   char *_IO_save_base ;
   char *_IO_backup_base ;
   char *_IO_save_end ;
   struct _IO_marker *_markers ;
   struct _IO_FILE *_chain ;
   int _fileno ;
   int _flags2 ;
   __off_t _old_offset ;
   unsigned short _cur_column ;
   signed char _vtable_offset ;
   char _shortbuf[1] ;
   _IO_lock_t *_lock ;
   __off64_t _offset ;
   void *__pad1 ;
   void *__pad2 ;
   void *__pad3 ;
   void *__pad4 ;
   size_t __pad5 ;
   int _mode ;
   char _unused2[(15UL * sizeof(int ) - 4UL * sizeof(void *)) - sizeof(size_t )] ;
};
# 133 "/usr/include/time.h"
struct tm {
   int tm_sec ;
   int tm_min ;
   int tm_hour ;
   int tm_mday ;
   int tm_mon ;
   int tm_year ;
   int tm_wday ;
   int tm_yday ;
   int tm_isdst ;
   long tm_gmtoff ;
   char const *tm_zone ;
};
# 96 "/usr/include/mpich/mpi.h"
typedef int MPI_Datatype;
# 265 "/usr/include/mpich/mpi.h"
typedef int MPI_Comm;
# 270 "/usr/include/mpich/mpi.h"
typedef int MPI_Group;
# 286 "/usr/include/mpich/mpi.h"
typedef int MPI_Op;
# 466 "/usr/include/stdlib.h"
extern __attribute__((__nothrow__)) void *malloc(size_t __size ) __attribute__((__malloc__)) ;
# 169 "/usr/include/stdio.h"
extern struct _IO_FILE *stdout ;
# 356 "/usr/include/stdio.h"
extern int fprintf(FILE * __restrict __stream , char const * __restrict __format
                   , ...) ;
# 362 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 192 "/usr/include/time.h"
extern __attribute__((__nothrow__)) time_t time(time_t *__timer ) ;
# 205 "/usr/include/time.h"
extern __attribute__((__nothrow__)) size_t strftime(char * __restrict __s , size_t __maxsize ,
                                                     char const * __restrict __format ,
                                                     struct tm const * __restrict __tp ) ;
# 243 "/usr/include/time.h"
extern __attribute__((__nothrow__)) struct tm *localtime(time_t const *__timer ) ;
# 964 "/usr/include/mpich/mpi.h"
extern int MPI_Reduce(void const *sendbuf , void *recvbuf , int count , MPI_Datatype datatype ,
                      MPI_Op op , int root , MPI_Comm comm ) ;
# 983 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_group(MPI_Comm comm , MPI_Group *group ) ;
# 987 "/usr/include/mpich/mpi.h"
extern int MPI_Group_incl(MPI_Group group , int n , int const *ranks , MPI_Group *newgroup ) ;
# 992 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_size(MPI_Comm comm , int *size ) ;
# 993 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_rank(MPI_Comm comm , int *rank ) ;
# 997 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_create(MPI_Comm comm , MPI_Group group , MPI_Comm *newcomm ) ;
# 1041 "/usr/include/mpich/mpi.h"
extern int MPI_Init(int *argc , char ***argv ) ;
# 1042 "/usr/include/mpich/mpi.h"
extern int MPI_Finalize(void) ;
# 7 "mpi_comm.c"
int main(int argc , char **argv ) ;
# 8 "mpi_comm.c"
void timestamp(void) ;
# 12 "mpi_comm.c"
int main(int argc , char **argv )
{
  MPI_Comm even_comm_id ;
  MPI_Group even_group_id ;
  int even_id ;
  int even_id_sum ;
  int even_p ;
  int *even_rank ;
  int i ;
  int id ;
  int ierr ;
  int j ;
  MPI_Comm odd_comm_id ;
  MPI_Group odd_group_id ;
  int odd_id ;
  int odd_id_sum ;
  int odd_p ;
  int *odd_rank ;
  int p ;
  MPI_Group world_group_id ;
  void *tmp ;
  int size1 ;
  void *tmp___0 ;
  int size2 ;
  int *mem_26 ;
  int *mem_27 ;
  int __retres28 ;

  {
  __globinit_mpi_comm();
# 71 "mpi_comm.c"
  ierr = MPI_Init(& argc, & argv);
  __CrestGetMPIInfo();
  __CrestWorldSize((unsigned long )(& p));
# 75 "mpi_comm.c"
  ierr = MPI_Comm_size(1140850688, & p);
  __CrestRank((unsigned long )(& id));
# 79 "mpi_comm.c"
  ierr = MPI_Comm_rank(1140850688, & id);
# 83 "mpi_comm.c"
  if (id == 0) {
    __CrestBranchOnly(3);
# 85 "mpi_comm.c"
    timestamp();
# 86 "mpi_comm.c"
    printf((char const * __restrict )"\n");
# 87 "mpi_comm.c"
    printf((char const * __restrict )"COMMUNICATOR_MPI - Master process:\n");
# 88 "mpi_comm.c"
    printf((char const * __restrict )"  C/MPI version\n");
# 89 "mpi_comm.c"
    printf((char const * __restrict )"  An MPI example program.\n");
# 90 "mpi_comm.c"
    printf((char const * __restrict )"\n");
# 91 "mpi_comm.c"
    printf((char const * __restrict )"  The number of processes is %d.\n", p);
# 92 "mpi_comm.c"
    printf((char const * __restrict )"\n");
  } else {
    __CrestBranchOnly(4);

  }
# 97 "mpi_comm.c"
  printf((char const * __restrict )"  Process %d says \'Hello, world!\'\n", id);
# 101 "mpi_comm.c"
  MPI_Comm_group(1140850688, & world_group_id);
# 105 "mpi_comm.c"
  even_p = (p + 1) / 2;
# 106 "mpi_comm.c"
  tmp = malloc((unsigned long )even_p * sizeof(int ));
# 106 "mpi_comm.c"
  even_rank = (int *)tmp;
# 107 "mpi_comm.c"
  j = 0;
# 108 "mpi_comm.c"
  i = 0;
# 108 "mpi_comm.c"
  while (1) {
    while_continue: ;
# 108 "mpi_comm.c"
    if (i < p) {
      __CrestBranchOnly(10);

    } else {
      __CrestBranchOnly(11);
# 108 "mpi_comm.c"
      goto while_break;
    }
# 110 "mpi_comm.c"
    mem_26 = even_rank + j;
# 110 "mpi_comm.c"
    *mem_26 = i;
# 111 "mpi_comm.c"
    j ++;
# 108 "mpi_comm.c"
    i += 2;
  }
  while_break:
# 113 "mpi_comm.c"
  MPI_Group_incl(world_group_id, even_p, (int const *)even_rank, & even_group_id);
# 115 "mpi_comm.c"
  MPI_Comm_create(1140850688, even_group_id, & even_comm_id);
# 117 "mpi_comm.c"
  MPI_Comm_size(even_comm_id, & size1);
# 121 "mpi_comm.c"
  odd_p = p / 2;
# 122 "mpi_comm.c"
  tmp___0 = malloc((unsigned long )odd_p * sizeof(int ));
# 122 "mpi_comm.c"
  odd_rank = (int *)tmp___0;
# 123 "mpi_comm.c"
  j = 0;
# 124 "mpi_comm.c"
  i = 1;
# 124 "mpi_comm.c"
  while (1) {
    while_continue___0: ;
# 124 "mpi_comm.c"
    if (i < p) {
      __CrestBranchOnly(19);

    } else {
      __CrestBranchOnly(20);
# 124 "mpi_comm.c"
      goto while_break___0;
    }
# 126 "mpi_comm.c"
    mem_27 = odd_rank + j;
# 126 "mpi_comm.c"
    *mem_27 = i;
# 127 "mpi_comm.c"
    j ++;
# 124 "mpi_comm.c"
    i += 2;
  }
  while_break___0:
# 129 "mpi_comm.c"
  MPI_Group_incl(world_group_id, odd_p, (int const *)odd_rank, & odd_group_id);
# 131 "mpi_comm.c"
  MPI_Comm_create(1140850688, odd_group_id, & odd_comm_id);
# 133 "mpi_comm.c"
  MPI_Comm_size(even_comm_id, & size2);
# 138 "mpi_comm.c"
  if (id % 2 == 0) {
    __CrestBranchOnly(25);
# 140 "mpi_comm.c"
    ierr = MPI_Comm_rank(even_comm_id, & even_id);
# 141 "mpi_comm.c"
    odd_id = -1;
  } else {
    __CrestBranchOnly(26);
# 145 "mpi_comm.c"
    ierr = MPI_Comm_rank(odd_comm_id, & odd_id);
# 146 "mpi_comm.c"
    even_id = -1;
  }
# 152 "mpi_comm.c"
  if (even_id != -1) {
    __CrestBranchOnly(28);
# 154 "mpi_comm.c"
    MPI_Reduce((void const *)(& id), (void *)(& even_id_sum), 1, 1275069445, 1476395011,
               0, even_comm_id);
  } else {
    __CrestBranchOnly(29);

  }
# 156 "mpi_comm.c"
  if (even_id == 0) {
    __CrestBranchOnly(31);
# 158 "mpi_comm.c"
    printf((char const * __restrict )"  Number of processes in even communicator = %d\n",
           even_p);
# 159 "mpi_comm.c"
    printf((char const * __restrict )"  Sum of global ID\'s in even communicator  = %d\n",
           even_id_sum);
  } else {
    __CrestBranchOnly(32);

  }
# 165 "mpi_comm.c"
  if (odd_id != -1) {
    __CrestBranchOnly(34);
# 167 "mpi_comm.c"
    MPI_Reduce((void const *)(& id), (void *)(& odd_id_sum), 1, 1275069445, 1476395011,
               0, odd_comm_id);
  } else {
    __CrestBranchOnly(35);

  }
# 169 "mpi_comm.c"
  if (odd_id == 0) {
    __CrestBranchOnly(37);
# 171 "mpi_comm.c"
    printf((char const * __restrict )"  Number of processes in odd communicator  = %d\n",
           odd_p);
# 172 "mpi_comm.c"
    printf((char const * __restrict )"  Sum of global ID\'s in odd communicator   = %d\n",
           odd_id_sum);
  } else {
    __CrestBranchOnly(38);

  }
# 177 "mpi_comm.c"
  ierr = MPI_Finalize();
# 181 "mpi_comm.c"
  if (id == 0) {
    __CrestBranchOnly(41);
# 183 "mpi_comm.c"
    printf((char const * __restrict )"\n");
# 184 "mpi_comm.c"
    printf((char const * __restrict )"COMMUNICATOR_MPI:\n");
# 185 "mpi_comm.c"
    printf((char const * __restrict )"  Normal end of execution.\n");
# 186 "mpi_comm.c"
    printf((char const * __restrict )"\n");
# 187 "mpi_comm.c"
    timestamp();
  } else {
    __CrestBranchOnly(42);

  }
# 189 "mpi_comm.c"
  __retres28 = 0;
# 12 "mpi_comm.c"
  return (__retres28);
}
}
# 224 "mpi_comm.c"
static char time_buffer[40] ;
# 193 "mpi_comm.c"
void timestamp(void)
{
  struct tm const *tm ;
  size_t len ;
  time_t now ;
  struct tm *tmp ;

  {
# 229 "mpi_comm.c"
  now = time((time_t *)((void *)0));
# 230 "mpi_comm.c"
  tmp = localtime((time_t const *)(& now));
# 230 "mpi_comm.c"
  tm = (struct tm const *)tmp;
# 232 "mpi_comm.c"
  len = strftime((char * __restrict )(time_buffer), (size_t )40, (char const * __restrict )"%d %B %Y %I:%M:%S %p",
                 (struct tm const * __restrict )tm);
# 234 "mpi_comm.c"
  fprintf((FILE * __restrict )stdout, (char const * __restrict )"%s\n", time_buffer);
# 193 "mpi_comm.c"
  return;
}
}
void __globinit_mpi_comm(void)
{


  {
  __CrestInit();
}
}
