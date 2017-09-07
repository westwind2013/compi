YICES_DIR=/home/westwind/myInstall/Develop/yices-1.0.40

CC=mpicxx
CFLAGS = -I. -I$(YICES_DIR)/include -I/usr/include/mpich/ -Wall -O0 -g -std=c++0x
CXXFLAGS = $(CFLAGS)
LDFLAGS = -O0 -g -L$(YICES_DIR)/lib -L/usr/lib/x86_64-linux-gnu
LOADLIBES = -lyices -lmpich -lopa -lmpl -lrt -lcr -lpthread

BASE_LIBS = base/basic_types.o base/symbolic_execution.o \
            base/symbolic_interpreter.o base/symbolic_path.o \
            base/symbolic_predicate.o base/symbolic_expression.o \
            base/yices_solver.o


all: libcrest/libcrest.a run_crest/run_crest \
     process_cfg/process_cfg tools/print_execution \
     install

libcrest/libcrest.a: libcrest/crest.o $(BASE_LIBS)
	$(AR) rsv $@ $^

run_crest/run_crest: run_crest/concolic_search.o $(BASE_LIBS)

tools/print_execution: $(BASE_LIBS)

install:
	# copy to install directory
	cp libcrest/libcrest.a ../lib
	cp run_crest/run_crest ../bin
	cp process_cfg/process_cfg ../bin
	cp tools/print_execution ../bin
	cp libcrest/crest.h ../include

clean:
	rm -f libcrest/libcrest.a run_crest/run_crest
	rm -f process_cfg/process_cfg tools/print_execution
	rm -f */*.o */*~ *~
