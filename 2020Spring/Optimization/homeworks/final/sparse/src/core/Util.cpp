#include "Util.h"

#include <Eigen/SVD>

#include <vector>
#include <cassert>

using namespace std;

float Ubpa::MutualCoherence(const Eigen::MatrixXf& A) {
	size_t N = A.cols();

	vector<float> norms(N);

	for (size_t i = 0; i < N; i++)
		norms[i] = A.col(i).norm();

	float max = 0.f;

	for (size_t i = 0; i < N; i++) {
		for (size_t j = i + 1; j < N; j++) {
			float ai_dot_aj = A.col(i).dot(A.col(j));
			float val = std::abs(ai_dot_aj) / norms[i] / norms[j];
			if (val > max)
				max = val;
		}
	}

	return max;
}

Eigen::VectorXf Ubpa::Shrink(const Eigen::VectorXf& z, float tau) {
	assert(tau > 0);

	size_t N = z.size();

	Eigen::VectorXf x(N);

	for (size_t i = 0; i < N; i++) {
		if (z[i] > tau)
			x[i] = z[i] - tau;
		else if (z[i] < -tau)
			x[i] = z[i] + tau;
		else
			x[i] = 0.f;
	}

	return x;
}

Eigen::VectorXf Ubpa::MoreauYosidaRegularization_Norm1(const Eigen::VectorXf& z, float tau) {
	return Shrink(z, tau);
}

Eigen::VectorXf Ubpa::MoreauYosidaRegularization_Norm2(const Eigen::VectorXf& z, float tau)
{
	assert(tau > 0);

	float normZ = z.norm();
	float coff = std::max(normZ - tau, 0.f);

	Eigen::VectorXf x = coff / normZ * z;

	return x;
}

Eigen::MatrixXf Ubpa::MoreauYosidaRegularization_NormNuclear(const Eigen::MatrixXf& Z, float tau)
{
	// ? : Eigen::ComputeThinU | Eigen::ComputeThinV
	Eigen::JacobiSVD<Eigen::MatrixXf> svd(Z, Eigen::ComputeThinU | Eigen::ComputeThinV);
	// Z = U * S * V^T
	Eigen::MatrixXf U = svd.matrixU();
	Eigen::MatrixXf V = svd.matrixV();
	Eigen::MatrixXf S = U.inverse() * Z * V.transpose().inverse();

	Eigen::VectorXf Z_diag = S.diagonal();
	Eigen::VectorXf X_diag = Shrink(Z_diag, tau);
	
	Eigen::MatrixXf X_S = Eigen::MatrixXf::Zero(Z_diag.size(), Z_diag.size());
	for (size_t i = 0; i < Z_diag.size(); i++)
		X_S(i, i) = X_diag(i);

	Eigen::MatrixXf X = U * X_S * V.transpose();

	return X;
}

bool Ubpa::ADMM::CheckSettingValid() const {
	if (mu <= 0.f)
		return false;

	if (rho <= 0.f)
		return false;

	if (alpha < 1.f)
		return false;

	if (beta >= 1.f || beta <= 0.f)
		return false;

	if (epsilon <= 0.f)
		return false;

	if (epsilon <= 0.f)
		return false;

	return true;
}

bool Ubpa::ADMM::SetProblem(Eigen::MatrixXf A, Eigen::VectorXf b) {
	if (A.rows() != b.size())
		return false;

	this->A = std::move(A);
	this->b = std::move(b);
	m = this->A.rows();
	n = this->A.cols();

	return true;
}

// set
// - x, y, z, u_y, u_z
// - cur_rho, last_residule
void Ubpa::ADMM::Init() {
	x.setZero(n);
	y.setZero(m);
	z.setZero(n);

	u_y.setZero(m);
	u_z.setZero(n);

	cur_rho = rho;
	last_residule = b.norm();
}

void Ubpa::ADMM::Iterate() {
	// common
	Eigen::MatrixXf AT = A.transpose();
	Eigen::VectorXf Ax = A * x;

	// [[ phase 1 ]]
	// update x, y, z
	// [formula]
	// x := argmin_x (x-z+u_z)^2 + (Ax-y-b+u_y)^2
	// y := argmin_y ||y||_q + rho/2 * (y-Ax+b-u_y)^2
	// z := argmin_z mu * ||z||_p + rho/2 * (z-x-u_z)^2
	// [result]
	// - x
	//      (x-z+u_z) + A^T(Ax-y-b+u_y) = 0
	//   => x = (I + A^T A)^-1 (z - u_z + A^T(y + b - u_y))
	// - y
	//   y = MoreauYosidaRegularization_Norm*(Ax-b+u_y, 1/rho)
	// - z
	//   z = MoreauYosidaRegularization_Norm*(x+u_z, mu/rho)

	x = (Eigen::MatrixXf::Identity(n, n) + AT * A).inverse() * (z - u_z + AT * (y + b - u_y));
	switch (q)
	{
	case Ubpa::ADMM::Norm::One:
		y = MoreauYosidaRegularization_Norm1(Ax - b + u_y, 1 / cur_rho);
		break;
	case Ubpa::ADMM::Norm::Two:
		y = MoreauYosidaRegularization_Norm2(Ax - b + u_y, 1 / cur_rho);
		break;
	default:
		assert(true && "not support");
		break;
	}
	switch (p)
	{
	case Ubpa::ADMM::Norm::One:
		z = MoreauYosidaRegularization_Norm1(x + u_z, mu / cur_rho);
		break;
	case Ubpa::ADMM::Norm::Two:
		z = MoreauYosidaRegularization_Norm2(x + u_z, mu / cur_rho);
		break;
	default:
		assert(true && "not support");
		break;
	}

	// [[ phase 2 ]]
	// update u_y, u_z
	// [formula]
	// u_y := u_y + gamma * (Ax - y - b)
	// u_z := u_z + gamma * (x - z)

	u_y += gamma * (Ax - y - b);
	u_z += gamma * (x - z);

	// [[ phase 3 ]]
	// update current settings: last_residule, cur_rho

	float cur_residule = std::sqrt((x - z).squaredNorm() + (Ax - y - b).squaredNorm());
	if (cur_residule / last_residule >= beta)
		cur_rho *= alpha;

	last_residule = cur_residule;
}

bool Ubpa::ADMM::IsStoppable() {
	return last_residule < epsilon;
}
