// Copyright (c) 2008, Jacob Burnim (jburnim@cs.berkeley.edu)
//
// This file is part of CREST, which is distributed under the revised
// BSD license.  A copy of this license can be found in the file LICENSE.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See LICENSE
// for details.

#include <assert.h>
#include <fstream>
#include <string>
#include <sys/time.h>
#include <vector>
#include <iostream>

#include "base/symbolic_interpreter.h"
#include "libcrest/crest.h"

#include "mpi.h"

using std::vector;
using namespace crest;

// The symbolic interpreter. */
static SymbolicInterpreter* SI;

// Have we read an input yet?  Until we have, generate only the
// minimal instrumentation necessary to track which branches were
// reached by the execution path.
static int pre_symbolic;

// Tables for converting from operators defined in libcrest/crest.h to
// those defined in base/basic_types.h.
static const int kOpTable[] =
{ // binary arithmetic
	ops::ADD, ops::SUBTRACT, ops::MULTIPLY, ops::CONCRETE, ops::CONCRETE,
	// binary bitwise operators
	ops::CONCRETE, ops::CONCRETE, ops::CONCRETE, ops::SHIFT_L, ops::CONCRETE,
	// binary logical operators
	ops::CONCRETE, ops::CONCRETE,
	// binary comparison
	ops::EQ, ops::NEQ, ops::GT, ops::LE, ops::LT, ops::GE,
	// unhandled binary operators
	ops::CONCRETE,
	// unary operators
	ops::NEGATE, ops::BITWISE_NOT, ops::LOGICAL_NOT
};


static void __CrestAtExit();


void __CrestInit() {
	// Initialize the random number generator.
	struct timeval tv;
	gettimeofday(&tv, NULL);
	srand((tv.tv_sec * 1000000) + tv.tv_usec);

	// Read the input.
	vector<value_t> input;
	std::ifstream in("input");
	value_t val;
	while (in >> val) {
		input.push_back(val);
	}
	in.close();

	// The number of execution times
	size_t num_iters = 0;
	std::ifstream infile(".num_iters");
	infile >> num_iters;
	infile.close();

	SI = new SymbolicInterpreter(input, num_iters);

	pre_symbolic = 1;

	assert(!atexit(__CrestAtExit));
}


void __CrestAtExit() {

	string outfile_name("szd_execution");
	const SymbolicExecution& ex = SI->execution();
	// Write the execution out to file 'szd_execution'.
	string buff;
	buff.reserve(1<<26);

	if (SI->rank_ == SI->target_rank_) ex.Serialize(&buff);
	else  ex.SerializeBranches(&buff);
	
	if (SI->rank_ != SI->target_rank_) outfile_name += std::to_string((long long)SI->rank_); 
	
	// debug
	//std::cout << outfile_name << std::endl;

	std::ofstream out(outfile_name.c_str(), std::ios::trunc | std::ios::out | std::ios::binary);
	out.write(buff.data(), buff.size());
	assert(!out.fail());
	out.close();

	//
	// hEdit: delete the object
	// 
	delete SI;
}

void __CrestGetMPIInfo() {

	std::ifstream infile(".target_rank");
	infile >> SI->target_rank_;
	infile.close();

	MPI_Comm_rank(MPI_COMM_WORLD, &(SI->rank_));
	MPI_Comm_size(MPI_COMM_WORLD, &(SI->world_size_));

	/*
	// open all the logging files
	if (SI->target_rank_ == SI->rank_) {
		SI->outfile_rank_indices.open(".rank_indices", std::ofstream::out |
				std::ofstream::trunc);
		SI->outfile_world_size_indices.open(".world_size_indices", std::ofstream::out |
				std::ofstream::trunc);
	}
	*/
	/*
	if (SI->target_rank_ == SI->rank_) {
		std::cout << "target_rank = " << SI->target_rank_ << std::endl;
		std::cout << "rank = " << SI->rank_ << std::endl;
		std::cout << "world_size = " << SI->world_size_ << std::endl;
	}*/
}

//
// Instrumentation functions.
//

void __CrestLoad(__CREST_ID id, __CREST_ADDR addr, __CREST_VALUE val) {
	if (!pre_symbolic)
		SI->Load(id, addr, val);
}


void __CrestStore(__CREST_ID id, __CREST_ADDR addr) {
	if (!pre_symbolic)
		SI->Store(id, addr);
}


void __CrestClearStack(__CREST_ID id) {
	if (!pre_symbolic)
		SI->ClearStack(id);
}


void __CrestApply1(__CREST_ID id, __CREST_OP op, __CREST_VALUE val) {
	assert((op >= __CREST_NEGATE) && (op <= __CREST_L_NOT));

	if (!pre_symbolic)
		SI->ApplyUnaryOp(id, static_cast<unary_op_t>(kOpTable[op]), val);
}


void __CrestApply2(__CREST_ID id, __CREST_OP op, __CREST_VALUE val) {
	assert((op >= __CREST_ADD) && (op <= __CREST_CONCRETE));

	if (pre_symbolic)
		return;

	if ((op >= __CREST_ADD) && (op <= __CREST_L_OR)) {
		SI->ApplyBinaryOp(id, static_cast<binary_op_t>(kOpTable[op]), val);
	} else {
		SI->ApplyCompareOp(id, static_cast<compare_op_t>(kOpTable[op]), val);
	}
}


void __CrestBranch(__CREST_ID id, __CREST_BRANCH_ID bid, __CREST_BOOL b) {
	if (pre_symbolic) {
		// Precede the branch with a fake (concrete) load.
		SI->Load(id, 0, b);
	}

	SI->Branch(id, bid, static_cast<bool>(b));
}


// 
// hEdit: this function would only be used when instrumenting only branches 
//
void __CrestBranchOnly(__CREST_BRANCH_ID bid) {
	SI->BranchOnly(bid);
}

void __CrestCall(__CREST_ID id, __CREST_FUNCTION_ID fid) {
	SI->Call(id, fid);
}


void __CrestReturn(__CREST_ID id) {
	SI->Return(id);
}


void __CrestHandleReturn(__CREST_ID id, __CREST_VALUE val) {
	if (!pre_symbolic)
		SI->HandleReturn(id, val);
}


//
// Symbolic input functions.
//

void __CrestUChar(unsigned char* x) {
	pre_symbolic = 0;
	*x = (unsigned char)SI->NewInput(types::U_CHAR, (addr_t)x);
}

void __CrestUCharWithLimit(unsigned char* x, long long int limit) {
	pre_symbolic = 0;
	*x = (unsigned char)SI->NewInputWithLimit(types::U_CHAR, (addr_t)x, limit);
}

void __CrestUShort(unsigned short* x) {
	pre_symbolic = 0;
	*x = (unsigned short)SI->NewInput(types::U_SHORT, (addr_t)x);
}

void __CrestUShortWithLimit(unsigned short* x, long long int limit) {
	pre_symbolic = 0;
	*x = (unsigned short)SI->NewInputWithLimit(types::U_SHORT, (addr_t)x, limit);
}

void __CrestUInt(unsigned int* x) {
	pre_symbolic = 0;
	*x = (unsigned int)SI->NewInput(types::U_INT, (addr_t)x);
}

void __CrestUIntWithLimit(unsigned int* x, long long int limit) {
	pre_symbolic = 0;
	*x = (unsigned int)SI->NewInputWithLimit(types::U_INT, (addr_t)x, limit);
}

void __CrestChar(char* x) {
	pre_symbolic = 0;
	*x = (char)SI->NewInput(types::CHAR, (addr_t)x);
}

void __CrestCharWithLimit(char* x, long long int limit) {
	pre_symbolic = 0;
	*x = (char)SI->NewInputWithLimit(types::CHAR, (addr_t)x, limit);
}

void __CrestShort(short* x) {
	pre_symbolic = 0;
	*x = (short)SI->NewInput(types::SHORT, (addr_t)x);
}

void __CrestShortWithLimit(short* x, long long int limit) {
	pre_symbolic = 0;
	*x = (short)SI->NewInputWithLimit(types::SHORT, (addr_t)x, limit);
}

void __CrestInt(int* x) {
	pre_symbolic = 0;
	*x = (int)SI->NewInput(types::INT, (addr_t)x);
}

void __CrestIntWithLimit(int* x, long long int limit) {
	pre_symbolic = 0;
	*x = (int)SI->NewInputWithLimit(types::INT, (addr_t)x, limit);
}

//
// hEdit: symbolic input function used to mark MPI rank.
// 
void __CrestRank(int* x) {
	pre_symbolic = 0;
	*x = (int)SI->NewInputRank(types::U_INT, (addr_t)x);
}


// 
// hEdit: 
// 
void __CrestAfterMPICommRank(MPI_Comm comm, int rank) {
	int size = 0;
	int *pComm = NULL;
	char is_this_group = 0, judge_this_group = 0;
	
	MPI_Comm_size(comm, &size);
	if (SI->rank_ == SI->target_rank_) {
		is_this_group = 1;
		pComm = new int [size];
	}
	MPI_Allreduce(&is_this_group, &judge_this_group, 1, MPI_CHAR, MPI_MAX, comm);
	
	// return if this is not the communicator of interest, i.e., the communicator
	// that includes the target rank
	if(judge_this_group == 0) return;

	// rank 0 gathers the result
	MPI_Gather(&(SI->rank_), 1, MPI_INT, pComm, 1, MPI_INT, 0, comm);

	if (SI->rank_ == SI->target_rank_) delete [] pComm;

	// return if the rank in the current comm is not 0
	if (rank != 0) return;

	// rank 0 logs the gathered result to a file

}

//
// hEdit: symbolic input function used to mark the size of 
// MPI_COMM_WORLD.
// 
void __CrestWorldSize(int* x) {
	pre_symbolic = 0;
	*x = (int)SI->NewInputWorldSize(types::U_INT, (addr_t)x);
}

void __CrestWorldSizeWithLimit(int* x, long long int limit) {
	pre_symbolic = 0;
	*x = (int)SI->NewInputWorldSizeWithLimit(types::U_INT, (addr_t)x, limit);
}
