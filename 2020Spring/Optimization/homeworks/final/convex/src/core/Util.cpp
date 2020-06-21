#include "Util.h"

#include <Eigen/SVD>

#include <iostream>

using namespace std;

bool Ubpa::PDIPM_QP::CheckSettingsValid() const {
	//float gamma{ 1.05f }; // t multiplier
	//float epsilon_feas{ 0.001f }; // residule error
	//float epsilon{ 0.001f }; // gap error
	//float beta{ 0.99f }; // alpha shrink multiplier
	//float tau{ 0.02f }; // backtracking

	if (gamma <= 1.f)
		return false;

	if (epsilon_feas <= 0 || epsilon <= 0)
		return false;

	if (beta <= 0 || beta >= 1)
		return false;

	if (tau <= 0 || tau >= 1)
		return false;
#ifndef NDEBUG
	else {
		if (tau < 0.01 || tau > 0.1)
			assert("tau is typically chosen in the range 0.01 to 0.1");
	}
#endif // !NDEBUG

	return true;
}

bool Ubpa::PDIPM_QP::SetProblem(
	Eigen::MatrixXf P, // n x n
	Eigen::VectorXf q, // n x 1
	float           r,

	Eigen::MatrixXf G, // m x n
	Eigen::VectorXf h, // m x 1

	Eigen::MatrixXf A, // p x n
	Eigen::VectorXf b  // p x 1
) {
	size_t n = P.rows();
	size_t m = G.rows();
	size_t p = A.rows();

	if (P.cols() != n
		|| q.size() != n
		|| G.cols() != n
		|| h.size() != m
		|| A.cols() != n
		|| b.size() != p)
	{
		return false;
	}

	this->P = std::move(P);
	this->q = std::move(q);
	this->r = r;

	this->G = std::move(G);
	this->h = std::move(h);

	this->A = std::move(A);
	this->b = std::move(b);

	this->n = n;
	this->m = m;
	this->p = p;

	return true;
}

void Ubpa::PDIPM_QP::Init() {
	// f(x) < 0
	// => Gx - h = -1
	// => x = pinv(G) * (h - 1)

	// presudo inverse of G
	Eigen::JacobiSVD<Eigen::MatrixXf> G_svd(G, Eigen::ComputeFullU | Eigen::ComputeFullV);
	const auto& SV = G_svd.singularValues();
	Eigen::MatrixXf ISV;
	ISV.setZero(G.cols(), G.rows());
	for (size_t i = 0; i < SV.size(); i++) {
		if (SV(i) > 0.000001f)
			ISV(i, i) = 1.f / SV(i);
	}
	Eigen::MatrixXf pinv_G = G_svd.matrixV() * ISV * G_svd.matrixU().transpose();

	x = pinv_G * (h - Eigen::VectorXf::Ones(m));

	lambda.setOnes(m); // > 0
	nu.setZero(p);

	Eigen::VectorXf f_x = -Eigen::VectorXf::Ones(m); // G * x - h

	eta = m; // -f_x.dot(lambda);
	float t = gamma; /* *m / eta */;

	Eigen::MatrixXf diag_lambda;
	diag_lambda.setZero(m, m);
	for (size_t i = 0; i < m; i++)
		diag_lambda(i, i) = lambda(i);

	r_dual = P * x + q + G.transpose() * lambda; /* + A.transpose() * nu */
	r_cent = -diag_lambda * f_x - (1.f / t) * Eigen::VectorXf::Ones(m);
	r_pri = A * x - b;
}

void Ubpa::PDIPM_QP::Iterate() {
	// [[ 1. compute Newton step ]]

	Eigen::MatrixXf M(n + m + p, n + m + p);
	M.setZero();

	Eigen::VectorXf f_x = G * x - h;

	// (0, 0) - (n-1, n-1)
	// P
	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++)
			M(i, j) = P(i, j);
	}

	// (0, n) - (n-1, n+m-1)
	// G^T
	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < m; j++)
			M(i, j + n) = G(j, i);
	}

	// (0, n+m) - (n-1, n+m+p-1)
	// A^T
	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < p; j++)
			M(i, j + n + m) = A(j, i);
	}

	// (n, 0) - (n+m-1, n-1)
	// - diag(lambda)G

	Eigen::MatrixXf diag_lambda;
	diag_lambda.setZero(m, m);
	for (size_t i = 0; i < m; i++)
		diag_lambda(i, i) = lambda(i);
	Eigen::MatrixXf diag_lambda_G = diag_lambda * G;
	for (size_t i = 0; i < m; i++) {
		for (size_t j = 0; j < n; j++)
			M(i + n, j) = -diag_lambda_G(i, j);
	}

	// (n, n) - (n+m-1, n+m-1)
	// - diag(f(x))
	for (size_t i = 0; i < m; i++)
		M(i + n, i + n) = -f_x(i);

	// (n+m, 0) - (n+m+p-1, n-1)
	// A
	for (size_t i = 0; i < p; i++) {
		for (size_t j = 0; j < n; j++)
			M(i + n + m, j) = A(i, j);
	}

	Eigen::VectorXf r(n + m + p);
	for (size_t i = 0; i < n; i++)
		r(i, 0) = r_dual(i);
	for (size_t i = 0; i < m; i++)
		r(i + n, 0) = r_cent(i);
	for (size_t i = 0; i < p; i++)
		r(i + n + m, 0) = r_pri(i);

	// y = (x, lambda, nu)
	// (n + m + p) x 1
	Eigen::VectorXf delta_y = M.colPivHouseholderQr().solve(-r);

	Eigen::VectorXf delta_x(n);
	Eigen::VectorXf delta_lambda(m);
	Eigen::VectorXf delta_nu(p);

	for (size_t i = 0; i < n; i++)
		delta_x(i, 0) = delta_y(i);
	for (size_t i = 0; i < m; i++)
		delta_lambda(i, 0) = delta_y(i + n);
	for (size_t i = 0; i < p; i++)
		delta_nu(i, 0) = delta_y(i + n + m);

	// [[ 2. backtracking line search ]]

	float alpha_max = 1.f;
	for (size_t i = 0; i < m; i++) {
		if (delta_lambda(i) < 0) {
			float cur = -lambda(i) / delta_lambda(i);
			if (cur < alpha_max)
				alpha_max = cur;
		}
	}

	float alpha = 0.99f * alpha_max;
	bool flag1 = false;
	bool flag2 = false;

	while (!flag1) {
		Eigen::VectorXf x_plus = x + alpha * delta_x;
		Eigen::VectorXf f_x_plus = G * x_plus - h;
		for (size_t i = 0; i < m; i++) {
			if (f_x_plus(i) >= 0) {
				alpha *= beta;
				break;
			}
			if (i == m - 1)
				flag1 = true;
		}
	}

	float rt_norm = Get_residule();

	while (!flag2) {
		Eigen::VectorXf x_plus = x + alpha * delta_x;
		Eigen::VectorXf lambda_plus = lambda + alpha * delta_lambda;
		Eigen::VectorXf nu_plus = nu + alpha * delta_nu;

		Eigen::MatrixXf diag_lambda_plus;
		diag_lambda_plus.setZero(m, m);
		for (size_t i = 0; i < m; i++)
			diag_lambda_plus(i, i) = lambda_plus(i);

		Eigen::VectorXf f_x_plus = G * x_plus - h;

		eta = -f_x_plus.dot(lambda_plus);
		float t = gamma * m / eta;

		r_dual = P * x_plus + q + G.transpose() * lambda_plus + A.transpose() * nu_plus;
		r_cent = -diag_lambda_plus * f_x_plus - (1.f / t) * Eigen::VectorXf::Ones(m);
		r_pri = A * x_plus - b;

		float rt_norm_plus = Get_residule();

		if (rt_norm_plus <= (1 - tau * alpha) * rt_norm)
			flag2 = true;
		else
			alpha *= beta;
	}

	// [[ 3. update ]]
	// x, lambda, nu

	x += alpha * delta_x;
	lambda += alpha * delta_lambda;
	nu += alpha * delta_nu;
}

bool Ubpa::PDIPM_QP::IsStoppable() {
	if (r_dual.norm() > epsilon_feas
		|| r_pri.norm() > epsilon_feas
		|| eta > epsilon)
	{
		return false;
	}

	return true;
}

float Ubpa::PDIPM_QP::Get_residule() const {
	return std::sqrt(
		r_dual.squaredNorm()
		+ r_cent.squaredNorm()
		+ r_pri.squaredNorm());
}