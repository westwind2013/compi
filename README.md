COMPI
=====

COMPI is an automated testing tool for MPI programs based on concolic testing.
It is created using the building blocks of CREST, a concolic test generation 
tool for C (CREST's homepage: https://burn.im/crest), based on about 3500 
C++/Ocaml source code line changes. 

Preparing a Program for COMPI
=====

To do:)

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

