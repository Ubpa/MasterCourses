#pragma once

#include <Eigen/Dense>

namespace Ubpa {
	// primal-dual interior-point method, quadratic program (QP)
	// [problem]
	// min 1/2 x^T P x + q^T x + r
	// s.t. Gx <= h
	//      Ax  = b
	class PDIPM_QP {
	public:
		float gamma{ 1.05f }; // t multiplier
		float epsilon_feas{ 0.001f }; // residule error
		float epsilon{ 0.001f }; // gap error
		float beta{ 0.99f }; // alpha shrink multiplier
		float tau{ 0.02f }; // backtracking

		bool CheckSettingsValid() const;

		bool SetProblem(
			Eigen::MatrixXf P, // n x n
			Eigen::VectorXf q, // n x 1
			float           r, // useless

			Eigen::MatrixXf G, // m x n
			Eigen::VectorXf h, // m x 1

			Eigen::MatrixXf A, // p x n
			Eigen::VectorXf b  // p x 1
		);

		void Init();

		void Iterate();

		bool IsStoppable();

		const Eigen::VectorXf& Get_x() const { return x; }
		const Eigen::VectorXf& Get_lambda() const { return lambda; }
		const Eigen::VectorXf& Get_nu() const { return nu; }
		const float& Get_eta() const { return eta; }
		float Get_residule() const;

	private:
		size_t n; // x's size
		size_t m; // number of inequality constraints
		size_t p; // number of equality constraints

		Eigen::MatrixXf P; // n x n
		Eigen::VectorXf q; // n x 1
		float r;

		Eigen::MatrixXf G; // m x n
		Eigen::VectorXf h; // m x 1
		
		Eigen::MatrixXf A; // p x n
		Eigen::VectorXf b; // p x 1

		Eigen::VectorXf x; // n x 1
		Eigen::VectorXf lambda; // m x 1
		Eigen::VectorXf nu; // p x 1

		Eigen::VectorXf r_dual; // dual residule;
		Eigen::VectorXf r_cent; // centrality residual
		Eigen::VectorXf r_pri; // primal residual
		
		float eta; // surrogate duality gap, > 0
	};
}
