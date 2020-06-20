#include <iostream>

#include <Util.h>

using namespace std;
using namespace Eigen;

int main() {
	// [[ 1. input ]]
	MatrixXf A(1, 1);
	A(0, 0) = 2;
	VectorXf b(1);
	b(0) = 2;

	// [[ 2. create ADMM object ]]
	Ubpa::ADMM admm;

	// [[ 3. settings ]]

	// admm.p = ADMM::Norm::One;
	// admm.q = ADMM::Norm::One;
	// admm.mu = 1.f;
	// admm.rho = 1.f;
	// admm.gamma = 0.05f;
	// admm.alpha = 1.05f;
	// admm.beta = 0.975f;
	// admm.epsilon = 0.001f;

	if (!admm.CheckSettingValid())
		return 1;

	// [[ 4. set A, b ]]

	admm.SetProblem(A, b);

	// [[ 5. init ]]
	admm.Init();

	// [[ 6. iteration ]]
	size_t i = 0;
	while (!admm.IsStoppable()) {
		admm.Iterate();
		cout
			<< "[ " << i << " ]" << endl
			<< "- x        : " << admm.Get_x() << endl
			<< "- y        : " << admm.Get_y() << endl
			<< "- z        : " << admm.Get_z() << endl
			<< "- rho      : " << admm.Get_cur_rho() << endl
			<< "- residual : " << admm.Get_cur_residule() << endl;

		i++;
	}

	// [[ 7. print result ]]
	cout
		<< endl
		<< "--------------------------------------------------------" << endl
		<< endl
		<< "[ result ]" << endl
		<< "- x        : " << admm.Get_x() << endl
		<< "- y        : " << admm.Get_y() << endl
		<< "- z        : " << admm.Get_z() << endl
		<< "- rho      : " << admm.Get_cur_rho() << endl
		<< "- residual : " << admm.Get_cur_residule() << endl;

	return 0;
}
