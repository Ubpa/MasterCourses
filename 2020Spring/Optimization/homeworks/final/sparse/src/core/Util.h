#pragma once

#include <Eigen/Dense>

namespace Ubpa {
	float MutualCoherence(const Eigen::MatrixXf& A);

	// problem: \min_x \|x\|_1 + \frac{1}{2\tau} \|x-z\|_2^2
	Eigen::VectorXf Shrink(const Eigen::VectorXf& z, float tau);

	// problem: \min_x \|x\|_1 + \frac{1}{2\tau} \|x-z\|_2^2
	// call Shrink(z, tau)
	Eigen::VectorXf MoreauYosidaRegularization_Norm1(const Eigen::VectorXf& z, float tau);

	// problem: \min_x \|x\|_2 + \frac{1}{2\tau} \|x-z\|_2^2
	Eigen::VectorXf MoreauYosidaRegularization_Norm2(const Eigen::VectorXf& z, float tau);

	// problem: \min_X \|X\|_* + \frac{1}{2\tau} \|X-Z\|_F^2
	Eigen::MatrixXf MoreauYosidaRegularization_NormNuclear(const Eigen::MatrixXf& z, float tau);

	// Alternating Direction Method of Multiplier (ADMM)
	// [problem]
	// \min_x \mu \|x\|_1 + \|Ax-b\|_1
	// [usage]
	// 1. setting
	// 2. CheckSettingValid
	// 3. SetProblem
	// 4. Init
	// 5. Iterate + IsStoppable [ + Get_* ]
	// 6. Get_x
	class ADMM {
	public:
		// settings
		enum class Norm { One, Two };

		Norm p{ Norm::One }; // norm type of x
		Norm q{ Norm::One }; // norm type of Ax-b

		float mu{ 1.f }; // coefficient of \|x\|_1 
		float rho{ 1.f }; // aka sigma, penalty factor, sufficiently large
		float gamma{ 0.05f }; // step size, default value is 1
		float alpha{ 1.05f }; // penalty factor enlargement coefficient, >= 1.f
		float beta{ 0.975f }; // penalty factor enlargement criterion coefficient
		float epsilon{ 0.001f }; // allowable error, stop when \sqrt{\|x-z\|_2^2 + \|Ax-y-b\|_2^2} \le \epsilon

		// ==========================

		bool CheckSettingValid() const;

		// set A, b, m, n
		bool SetProblem(Eigen::MatrixXf A, Eigen::VectorXf b);

		// - x, y, z, u_y, u_z
		// - cur_rho, last_residule
		void Init();

		void Iterate();

		bool IsStoppable();

		const Eigen::VectorXf& Get_x() const { return x; }
		const Eigen::VectorXf& Get_y() const { return y; }
		const Eigen::VectorXf& Get_z() const { return z; }
		const float& Get_cur_rho() const { return cur_rho; }
		const float& Get_cur_residule() const { return last_residule; }

	private:
		size_t m{ static_cast<size_t>(-1) }; // number of equality constraints
		size_t n{ static_cast<size_t>(-1) };  // x's size

		Eigen::MatrixXf A; // m x n
		Eigen::VectorXf b; // m x 1

		Eigen::VectorXf u_y; // m x 1, u_y = lambda_y / rho
		Eigen::VectorXf u_z; // n x 1, u_y = lambda_z / rho

		Eigen::VectorXf x; // n x 1
		Eigen::VectorXf y; // m x 1
		Eigen::VectorXf z; // n x 1

		float cur_rho;
		float last_residule;
	};
}
