#include <iostream>

#include <string>

#include <Util.h>

using namespace std;
using namespace Eigen;
using namespace Ubpa;

int main() {
	size_t n, m, p;
	cin >> n >> m >> p;

	PDIPM_QP pdipm;

	string key;
	string value;
	while (true) {
		cin >> key;
		if (key == "KEY_END")
			break;
		cin >> value;

		float fvalue = std::atof(value.c_str());
		if (key == "gamma")
			pdipm.gamma = fvalue;
		else if (key == "epsilon_feas")
			pdipm.epsilon_feas = fvalue;
		else if (key == "epsilon")
			pdipm.epsilon = fvalue;
		else if (key == "beta")
			pdipm.beta = fvalue;
		else if (key == "tau")
			pdipm.tau = fvalue;
		else
			assert("not support");
	}

	// pdipm.gamma = 1.05f; // t multiplier
	// pdipm.epsilon_feas = 0.001f; // residule error
	// pdipm.epsilon = 0.001f; // gap error
	// pdipm.beta = 0.99f; // alpha shrink multiplier
	// pdipm.02f; // backtracking

	if (!pdipm.CheckSettingsValid())
		return 1;

	MatrixXf P(n, n);
	MatrixXf G(m, n);
	MatrixXf A(p, n);
	VectorXf q(n);
	VectorXf h(m);
	VectorXf b(p);
	float r;

	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++)
			cin >> P(i, j);
	}
	for (size_t i = 0; i < n; i++)
		cin >> q(i, 0);
	cin >> r;

	for (size_t i = 0; i < m; i++) {
		for (size_t j = 0; j < n; j++)
			cin >> G(i, j);
	}
	for (size_t i = 0; i < m; i++)
		cin >> h(i, 0);

	for (size_t i = 0; i < p; i++) {
		for (size_t j = 0; j < n; j++)
			cin >> A(i, j);
	}
	for (size_t i = 0; i < p; i++)
		cin >> b(i, 0);

	pdipm.SetProblem(
		P, q, r,
		G, h,
		A, b);

	pdipm.Init();

	size_t i = 0;
	while (!pdipm.IsStoppable()) {
		pdipm.Iterate();
		cout << "[ " << i << " ]" << endl
			<< "- x" << endl << pdipm.Get_x() << endl
			<< "- lambda" << endl << pdipm.Get_lambda() << endl
			<< "- nu" << endl << pdipm.Get_nu() << endl
			<< "- residule : " << pdipm.Get_residule() << endl;

		i++;
	}

	cout << "[ result ]" << endl
		<< "- x" << endl << pdipm.Get_x() << endl
		<< "- lambda" << endl << pdipm.Get_lambda() << endl
		<< "- nu" << endl << pdipm.Get_nu() << endl
		<< "- residule : " << pdipm.Get_residule() << endl;

	return 0;
}
