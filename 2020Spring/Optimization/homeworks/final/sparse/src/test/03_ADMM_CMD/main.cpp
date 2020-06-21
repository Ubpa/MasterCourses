#include <iostream>
#include <string>

#include <Util.h>

using namespace std;
using namespace Eigen;

int main() {
	size_t n, m;
	cin >> n >> m;

	// [[ 1. input ]]
	MatrixXf A(m, n);
	VectorXf b(m, 1);

	for (size_t i = 0; i < m; i++) {
		for (size_t j = 0; j < n; j++)
			cin >> A(i, j);
	}

	for (size_t i = 0; i < m; i++)
		cin >> b(i, 0);

	// [[ 2. create ADMM object ]]
	Ubpa::ADMM admm;

	// [[ 3. settings ]]

	std::string key;
	std::string value;
	while (true) {
		cin >> key;
		if (key == "KEY_END")
			break;
		cin >> value;

		if (key == "p") {
			int norm = std::atoi(value.c_str());
			if (norm == 1)
				admm.p = Ubpa::ADMM::Norm::One;
			else if (norm == 2)
				admm.p = Ubpa::ADMM::Norm::Two;
			else
				assert("not support");
		}
		else if (key == "q") {
			int norm = std::atoi(value.c_str());
			if (norm == 1)
				admm.q = Ubpa::ADMM::Norm::One;
			else if (norm == 2)
				admm.q = Ubpa::ADMM::Norm::Two;
			else
				assert("not support");
		}
		else {
			float fvalue = std::atof(value.c_str());
			if (key == "mu")
				admm.mu = fvalue;
			else if (key == "rho")
				admm.rho = fvalue;
			else if (key == "gamma")
				admm.gamma = fvalue;
			else if (key == "alpha")
				admm.alpha = fvalue;
			else if (key == "beta")
				admm.beta = fvalue;
			else if (key == "epsilon")
				admm.epsilon = fvalue;
			else
				assert("not support");
		}
	}

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
