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


Building COMPI
====

1. Install Yices 1 (http://yices.csl.sri.com/old/download-yices1.shtml), a SMT 
solver used by COMPI to solve symbolic constraints. 

2. Specify the root directory of Yices in the Makefile inside  COMPI_DIR/src.

3. Build COMPI_DIR/cil, which contains the instrumentation module. 

4. Build COMPI_DIR/src. 

5. Add COMPI_DIR/bin to environment variable "PATH". 

Preparing a Single-file Program for COMPI
=====

See the example in COMPI_DIR/test

1. Run "cm1 YOUR_PROGRAM" (this generates a executable with light instrumentation).

2. Run "cm2 YOUR_PROGRAM" (this generates a executable with heavy instrumentation).

3. Launch your testing against your program with "run_crest ./executable num_procs 
target_rank num_of_tests -dfs"

Preparing a Multi-file Program for COMPI
=====

To do. 

Running COMPI
=====

To do:)

Setup
=====

COMPI depends on Yices 1, an SMT solver tool and library available at
http://yices.csl.sri.com/old/download-yices1.shtml.  To build and run
COMPI, you must download and install Yices *version 1* and change
YICES_DIR in src/Makefile to point to Yices location.

COMPI uses CIL to instrument C programs for testing.  A modified
distribution of CIL is included in directory cil/.  To build CIL,
simply run "configure" and "make" in the cil/ directory.

Finally, COMPI can be built by running "make" in the src/ directory.


License
=====

