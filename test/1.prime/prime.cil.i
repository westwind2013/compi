# 1 "./prime.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./prime.cil.c"
# 15 "prime.c"
void __globinit_prime(void) ;
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
# 286 "/usr/include/mpich/mpi.h"
typedef int MPI_Op;
# 211 "/usr/lib/gcc/x86_64-linux-gnu/4.4.7/include/stddef.h"
typedef unsigned long size_t;
# 139 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __time_t;
# 75 "/usr/include/time.h"
typedef __time_t time_t;
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
# 929 "/usr/include/mpich/mpi.h"
extern int MPI_Bcast(void *buffer , int count , MPI_Datatype datatype , int root ,
                     MPI_Comm comm ) ;
# 964 "/usr/include/mpich/mpi.h"
extern int MPI_Reduce(void const *sendbuf , void *recvbuf , int count , MPI_Datatype datatype ,
                      MPI_Op op , int root , MPI_Comm comm ) ;
# 992 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_size(MPI_Comm comm , int *size ) ;
# 993 "/usr/include/mpich/mpi.h"
extern int MPI_Comm_rank(MPI_Comm comm , int *rank ) ;
# 1039 "/usr/include/mpich/mpi.h"
extern double MPI_Wtime(void) ;
# 1041 "/usr/include/mpich/mpi.h"
extern int MPI_Init(int *argc , char ***argv ) ;
# 1042 "/usr/include/mpich/mpi.h"
extern int MPI_Finalize(void) ;
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
# 208 "/home/westwind/myInstall/crest.mpi/bin/../include/crest.h"
extern void __CrestInt(int *x ) __attribute__((__crest_skip__)) ;
# 213 "/home/westwind/myInstall/crest.mpi/bin/../include/crest.h"
extern void __CrestIntRank(int *x ) __attribute__((__crest_skip__)) ;
# 9 "prime.c"
int main(int argc , char **argv ) ;
# 10 "prime.c"
int prime_number(int n , int id , int p ) ;
# 11 "prime.c"
void timestamp(void) ;
# 15 "prime.c"
int main(int argc , char **argv )
{
  int id ;
  int ierr ;
  int n ;
  int n_factor ;
  int n_hi ;
  int n_lo ;
  int p ;
  int primes ;
  int primes_part ;
  double wtime ;
  double tmp ;
  int __retres15 ;

  {
  __globinit_prime();
  __CrestCall(2, 1);
  __CrestStore(1, (unsigned long )(& argc));
# 56 "prime.c"
  __CrestInt(& n_lo);
# 57 "prime.c"
  __CrestInt(& n_hi);
# 58 "prime.c"
  __CrestInt(& n_factor);
# 60 "prime.c"
  __CrestIntRank(& id);
# 67 "prime.c"
  ierr = MPI_Init(& argc, & argv);
  __CrestHandleReturn(4, (long long )ierr);
  __CrestStore(3, (unsigned long )(& ierr));
  __CrestLoad(5, (unsigned long )0, (long long )1140850688);
# 71 "prime.c"
  ierr = MPI_Comm_size(1140850688, & p);
  __CrestHandleReturn(7, (long long )ierr);
  __CrestStore(6, (unsigned long )(& ierr));
  __CrestLoad(8, (unsigned long )0, (long long )1140850688);
# 75 "prime.c"
  ierr = MPI_Comm_rank(1140850688, & id);
  __CrestHandleReturn(10, (long long )ierr);
  __CrestStore(9, (unsigned long )(& ierr));
  __CrestLoad(13, (unsigned long )(& id), (long long )id);
  __CrestLoad(12, (unsigned long )0, (long long )0);
  __CrestApply2(11, 12, (long long )(id == 0));
# 77 "prime.c"
  if (id == 0) {
    __CrestBranch(14, 3, 1);
# 79 "prime.c"
    timestamp();
    __CrestClearStack(16);
# 80 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(17);
# 81 "prime.c"
    printf((char const * __restrict )"PRIME_MPI\n");
    __CrestClearStack(18);
# 82 "prime.c"
    printf((char const * __restrict )"  C/MPI version\n");
    __CrestClearStack(19);
# 83 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(20);
# 84 "prime.c"
    printf((char const * __restrict )"  An MPI example program to count the number of primes.\n");
    __CrestClearStack(21);
    __CrestLoad(22, (unsigned long )(& p), (long long )p);
# 85 "prime.c"
    printf((char const * __restrict )"  The number of processes is %d\n", p);
    __CrestClearStack(23);
# 86 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(24);
# 87 "prime.c"
    printf((char const * __restrict )"         N        Pi          Time\n");
    __CrestClearStack(25);
# 88 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(26);
  } else {
    __CrestBranch(15, 4, 0);

  }
  __CrestLoad(27, (unsigned long )(& n_lo), (long long )n_lo);
  __CrestStore(28, (unsigned long )(& n));
# 91 "prime.c"
  n = n_lo;
# 93 "prime.c"
  while (1) {
    while_continue: ;
    {
    __CrestLoad(31, (unsigned long )(& n), (long long )n);
    __CrestLoad(30, (unsigned long )(& n_hi), (long long )n_hi);
    __CrestApply2(29, 15, (long long )(n <= n_hi));
# 93 "prime.c"
    if (n <= n_hi) {
      __CrestBranch(32, 10, 1);

    } else {
      __CrestBranch(33, 11, 0);
# 93 "prime.c"
      goto while_break;
    }
    }
    {
    __CrestLoad(36, (unsigned long )(& id), (long long )id);
    __CrestLoad(35, (unsigned long )0, (long long )0);
    __CrestApply2(34, 12, (long long )(id == 0));
# 95 "prime.c"
    if (id == 0) {
      __CrestBranch(37, 13, 1);
# 97 "prime.c"
      wtime = MPI_Wtime();
      __CrestClearStack(39);
    } else {
      __CrestBranch(38, 14, 0);

    }
    }
    __CrestLoad(40, (unsigned long )0, (long long )1);
    __CrestLoad(41, (unsigned long )0, (long long )1275069445);
    __CrestLoad(42, (unsigned long )0, (long long )0);
    __CrestLoad(43, (unsigned long )0, (long long )1140850688);
# 99 "prime.c"
    ierr = MPI_Bcast((void *)(& n), 1, 1275069445, 0, 1140850688);
    __CrestHandleReturn(45, (long long )ierr);
    __CrestStore(44, (unsigned long )(& ierr));
    __CrestLoad(46, (unsigned long )(& n), (long long )n);
    __CrestLoad(47, (unsigned long )(& id), (long long )id);
    __CrestLoad(48, (unsigned long )(& p), (long long )p);
# 101 "prime.c"
    primes_part = prime_number(n, id, p);
    __CrestHandleReturn(50, (long long )primes_part);
    __CrestStore(49, (unsigned long )(& primes_part));
    __CrestLoad(51, (unsigned long )0, (long long )1);
    __CrestLoad(52, (unsigned long )0, (long long )1275069445);
    __CrestLoad(53, (unsigned long )0, (long long )1476395011);
    __CrestLoad(54, (unsigned long )0, (long long )0);
    __CrestLoad(55, (unsigned long )0, (long long )1140850688);
# 103 "prime.c"
    ierr = MPI_Reduce((void const *)(& primes_part), (void *)(& primes), 1, 1275069445,
                      1476395011, 0, 1140850688);
    __CrestHandleReturn(57, (long long )ierr);
    __CrestStore(56, (unsigned long )(& ierr));
    {
    __CrestLoad(60, (unsigned long )(& id), (long long )id);
    __CrestLoad(59, (unsigned long )0, (long long )0);
    __CrestApply2(58, 12, (long long )(id == 0));
# 106 "prime.c"
    if (id == 0) {
      __CrestBranch(61, 17, 1);
# 108 "prime.c"
      tmp = MPI_Wtime();
      __CrestClearStack(63);
# 108 "prime.c"
      wtime = tmp - wtime;
    } else {
      __CrestBranch(62, 18, 0);

    }
    }
    __CrestLoad(66, (unsigned long )(& n), (long long )n);
    __CrestLoad(65, (unsigned long )(& n_factor), (long long )n_factor);
    __CrestApply2(64, 2, (long long )(n * n_factor));
    __CrestStore(67, (unsigned long )(& n));
# 111 "prime.c"
    n *= n_factor;
  }
  while_break:
# 116 "prime.c"
  ierr = MPI_Finalize();
  __CrestHandleReturn(69, (long long )ierr);
  __CrestStore(68, (unsigned long )(& ierr));
  __CrestLoad(72, (unsigned long )(& id), (long long )id);
  __CrestLoad(71, (unsigned long )0, (long long )0);
  __CrestApply2(70, 12, (long long )(id == 0));
# 120 "prime.c"
  if (id == 0) {
    __CrestBranch(73, 23, 1);
# 122 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(75);
# 123 "prime.c"
    printf((char const * __restrict )"PRIME_MPI - Master process:\n");
    __CrestClearStack(76);
# 124 "prime.c"
    printf((char const * __restrict )"  Normal end of execution.\n");
    __CrestClearStack(77);
# 125 "prime.c"
    printf((char const * __restrict )"\n");
    __CrestClearStack(78);
# 126 "prime.c"
    timestamp();
    __CrestClearStack(79);
  } else {
    __CrestBranch(74, 24, 0);

  }
  __CrestLoad(80, (unsigned long )0, (long long )0);
  __CrestStore(81, (unsigned long )(& __retres15));
# 129 "prime.c"
  __retres15 = 0;
  __CrestLoad(82, (unsigned long )(& __retres15), (long long )__retres15);
  __CrestReturn(83);
# 15 "prime.c"
  return (__retres15);
}
}
# 133 "prime.c"
int prime_number(int n , int id , int p )
{
  int i ;
  int j ;
  int prime ;
  int total ;

  {
  __CrestCall(87, 2);
  __CrestStore(86, (unsigned long )(& p));
  __CrestStore(85, (unsigned long )(& id));
  __CrestStore(84, (unsigned long )(& n));
  __CrestLoad(88, (unsigned long )0, (long long )0);
  __CrestStore(89, (unsigned long )(& total));
# 193 "prime.c"
  total = 0;
  __CrestLoad(92, (unsigned long )0, (long long )2);
  __CrestLoad(91, (unsigned long )(& id), (long long )id);
  __CrestApply2(90, 0, (long long )(2 + id));
  __CrestStore(93, (unsigned long )(& i));
# 195 "prime.c"
  i = 2 + id;
  {
# 195 "prime.c"
  while (1) {
    while_continue: ;
    {
    __CrestLoad(96, (unsigned long )(& i), (long long )i);
    __CrestLoad(95, (unsigned long )(& n), (long long )n);
    __CrestApply2(94, 15, (long long )(i <= n));
# 195 "prime.c"
    if (i <= n) {
      __CrestBranch(97, 32, 1);

    } else {
      __CrestBranch(98, 33, 0);
# 195 "prime.c"
      goto while_break;
    }
    }
    __CrestLoad(99, (unsigned long )0, (long long )1);
    __CrestStore(100, (unsigned long )(& prime));
# 197 "prime.c"
    prime = 1;
    __CrestLoad(101, (unsigned long )0, (long long )2);
    __CrestStore(102, (unsigned long )(& j));
# 198 "prime.c"
    j = 2;
    {
# 198 "prime.c"
    while (1) {
      while_continue___0: ;
      {
      __CrestLoad(105, (unsigned long )(& j), (long long )j);
      __CrestLoad(104, (unsigned long )(& i), (long long )i);
      __CrestApply2(103, 16, (long long )(j < i));
# 198 "prime.c"
      if (j < i) {
        __CrestBranch(106, 39, 1);

      } else {
        __CrestBranch(107, 40, 0);
# 198 "prime.c"
        goto while_break___0;
      }
      }
      {
      __CrestLoad(112, (unsigned long )(& i), (long long )i);
      __CrestLoad(111, (unsigned long )(& j), (long long )j);
      __CrestApply2(110, 4, (long long )(i % j));
      __CrestLoad(109, (unsigned long )0, (long long )0);
      __CrestApply2(108, 12, (long long )(i % j == 0));
# 200 "prime.c"
      if (i % j == 0) {
        __CrestBranch(113, 42, 1);
        __CrestLoad(115, (unsigned long )0, (long long )0);
        __CrestStore(116, (unsigned long )(& prime));
# 202 "prime.c"
        prime = 0;
# 203 "prime.c"
        goto while_break___0;
      } else {
        __CrestBranch(114, 44, 0);

      }
      }
      __CrestLoad(119, (unsigned long )(& j), (long long )j);
      __CrestLoad(118, (unsigned long )0, (long long )1);
      __CrestApply2(117, 0, (long long )(j + 1));
      __CrestStore(120, (unsigned long )(& j));
# 198 "prime.c"
      j ++;
    }
    while_break___0: ;
    }
    __CrestLoad(123, (unsigned long )(& total), (long long )total);
    __CrestLoad(122, (unsigned long )(& prime), (long long )prime);
    __CrestApply2(121, 0, (long long )(total + prime));
    __CrestStore(124, (unsigned long )(& total));
# 206 "prime.c"
    total += prime;
    __CrestLoad(127, (unsigned long )(& i), (long long )i);
    __CrestLoad(126, (unsigned long )(& p), (long long )p);
    __CrestApply2(125, 0, (long long )(i + p));
    __CrestStore(128, (unsigned long )(& i));
# 195 "prime.c"
    i += p;
  }
  while_break: ;
  }
  {
  __CrestLoad(129, (unsigned long )(& total), (long long )total);
  __CrestReturn(130);
# 208 "prime.c"
  return (total);
  }
}
}
# 243 "prime.c"
static char time_buffer[40] ;
# 212 "prime.c"
void timestamp(void)
{
  struct tm const *tm ;
  size_t len ;
  time_t now ;
  struct tm *tmp ;

  {
  __CrestCall(131, 3);
# 248 "prime.c"
  now = time((time_t *)((void *)0));
  __CrestHandleReturn(133, (long long )now);
  __CrestStore(132, (unsigned long )(& now));
# 249 "prime.c"
  tmp = localtime((time_t const *)(& now));
  __CrestClearStack(134);
# 249 "prime.c"
  tm = (struct tm const *)tmp;
  __CrestLoad(135, (unsigned long )0, (long long )((size_t )40));
# 251 "prime.c"
  len = strftime((char * __restrict )(time_buffer), (size_t )40, (char const * __restrict )"%d %B %Y %I:%M:%S %p",
                 (struct tm const * __restrict )tm);
  __CrestHandleReturn(137, (long long )len);
  __CrestStore(136, (unsigned long )(& len));
# 253 "prime.c"
  printf((char const * __restrict )"%s\n", time_buffer);
  __CrestClearStack(138);

  {
  __CrestReturn(139);
# 212 "prime.c"
  return;
  }
}
}
void __globinit_prime(void)
{


  {
  __CrestInit();
}
}
