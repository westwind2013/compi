// Copyright (c) 2008, Jacob Burnim (jburnim@cs.berkeley.edu)
// Copyright (c) 2018, Hongbo Li (hli035@cs.ucr.edu)
//
// This file is part of CREST, which is distributed under the revised
// BSD license.  A copy of this license can be found in the file LICENSE.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See LICENSE
// for details.

#ifndef BASE_YICES_SOLVER_H__
#define BASE_YICES_SOLVER_H__

#include <map>
#include <vector>
#include <unordered_set>

#include "base/basic_types.h"
#include "base/symbolic_predicate.h"
#include "base/symbolic_execution.h"

using std::map;
using std::vector;

namespace crest {

	class YicesSolver {
		public:
			YicesSolver();

			~YicesSolver();

			//bool GetMPIInfoByFile();

			//bool GetMPIInfo(std::unordered_set<int>& comm_world_size, 
			//	std::unordered_set<int>& rank_indices);
			//bool GetMPIInfo(const std::vector<int>& world_size_indices, 
			//	const std::vector<int>& rank_indices);

			void GenerateConstraintsMPI(const SymbolicExecution& ex);

			bool IncrementalSolve(const vector<value_t>& old_soln,
					const map<var_t,type_t>& vars,
					vector<const SymbolicPred*>& constraints,
					map<var_t,value_t>* soln);

			bool Solve(const map<var_t,type_t>& vars,
					const vector<const SymbolicPred*>& constraints,
					map<var_t,value_t>* soln);

			bool ReadSolutionFromFileOrDie(const string& file,
					map<var_t,value_t>* soln);

		private:
			vector<id_t> rank_indices_;
			vector<id_t> world_size_indices_;
			//vector<SymbolicExpr *> exprsMPI;
			vector<SymbolicPred *> constraintsMPI;
	};

}  // namespace crest


#endif  // BASE_YICES_SOLVER_H__
