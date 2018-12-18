COMPI
=====

COMPI is an automated testing tool for MPI programs based on concolic testing.
It is created using the building blocks of CREST, a concolic test generation 
tool for C (CREST's homepage: https://burn.im/crest), based on about 3500 
C++/Ocaml source code line changes. 

COMPI extends CREST with following major features.

First, it supports automated testing of MPI application. It drives the concolic 
testing using one process (focus process) and record the coverages across all 
processes. It can automatically vary the focus process as well as the number of 
processes in the testing. This feature helps COMPI uncover branches that cannot 
be uncovered otherwise and precisely record branch coverages. 

Second, it control the testing cost efficiently via three techniques: (1) input 
capping — allowing developers to cap the values of marked variables so as to 
limit the problem size and control the testing time cost; (2) two-way 
instrumentation — generating two versions of the target program with one being
heavily-instrumented to be used by one single process and the other being 
lightly-instrumented to be used by the others; and (3) constraint set 
reduction — reducing the constraint sets’ sizes by removing redundant constraints 
so as to avoid significant redundant tests resulted from loops’ presence.

For details, please refer to:

[COMPI: Concolic Testing for MPI Applications](https://ieeexplore.ieee.org/abstract/document/8425240/metrics#metrics)

Hongbo Li , Sihuan Li, Zachary Benavides, Zizhong Chen, and Rajiv Gupta

32nd IEEE International Parallel and Distributed Processing Symposium, 

10 pages, Vancouver, British Columbia, Canada, May 2018. 


Building COMPI
====

1. Install Yices 1 (http://yices.csl.sri.com/old/download-yices1.shtml), a SMT 
solver used by COMPI to solve symbolic constraints. 

2. Specify the root directory of Yices in the Makefile inside  COMPI_DIR/src.

3. Build COMPI_DIR/cil, which contains the instrumentation module. 

4. Build COMPI_DIR/src. 

5. Add COMPI_DIR/bin to environment variable "PATH" so that all the commands/executables
inside the directory can be used without specifying their full paths

Preparing a Single-file Program for COMPI
=====

See the example in COMPI_DIR/test

1. Mark the variables that dominate the program's execution path as symbolic. 

2. Run "cm1 PROGRAM.c" (this generates a executable with light instrumentation), 
which generates an executable named "PROGRAM_c" used for launching the non-focus
processes.

3. Run "cm2 PROGRAM.c" (this generates a executable with heavy instrumentation),
which generates an executable named "PROGRAM" used for launching the focus process.

Preparing a Multi-file Program for COMPI
=====

See the example in COMPI_DIR/test/HPL

1. Mark the variables that dominate the program's execution path as symbolic. 

2. Have two copies of Makefile so that Makefile (1) direct the building of the program
used for launching the non-focus processes and Makefile (2) direct the building 
of the progam used for launching the focus process. Makfile (1) requires following changes. First, change the compiler: "CC = gcc" --> "CC = cilly". Second, add additional flags for compiling: "CFLAGS = " --> "CFLAGS = --save-temps --doCrestBranch --merge". Third, add additional flags for linking: "LDFLAGS = " --> "LDFLAGS = --save-temps --doCrestBranch --merge --keepmerged". Forth, change the archiver (if needed): "ARCHIVER = ar" --> "ARCHIVER = cilly --merge --mode=AR". The changes of Makefile (2) only differs by changing all the appearances of "doCrestBranch" to "doCrestAll".

3. Build with each Makefile so as to generates the two executables and place the two in the same directory where you wish to run the program.

References: 

https://github.com/jburnim/crest/wiki/CREST-Frequently-Asked-Questions

https://people.eecs.berkeley.edu/~necula/cil/cil007.html

Running COMPI
=====

Launch the testing with 

run_crest ./PROGRAM num_procs target_rank num_of_tests -dfs,

where PROGRAM is the generated executable, num_procs denotes the number of processes to be used in the testing, target_rank denotes the MPI rank used for concolic testing, and num_of_tests denotes the number of iterations used in the testing, -dfs denotes the search strategy.  

License
=====

