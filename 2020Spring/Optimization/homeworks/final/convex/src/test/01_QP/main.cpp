#include <iostream>

#include <Util.h>

using namespace std;
using namespace Eigen;
using namespace Ubpa;

int main() {
	PDIPM_QP pdipm;

	// pdipm.gamma = 1.05f; // t multiplier
	// pdipm.epsilon_feas = 0.001f; // residule error
	// pdipm.epsilon = 0.001f; // gap error
	// pdipm.beta = 0.99f; // alpha shrink multiplier
	// pdipm.02f; // backtracking

	if (!pdipm.CheckSettingsValid())
		return 1;

	MatrixXf P, G, A;
	VectorXf q, h, b;
	float r;

	P.setIdentity(2, 2);
	q.setZero(2);
	r = 0.f;

	G.resize(1, 2);
	G(0, 0) = 1; G(0, 1) = -1;

	h.resize(1);
	h(0, 0) = -1;

	A.resize(1, 2);
	A(0, 0) = 0; A(0, 1) = 1;

	b.resize(1);
	b(0, 0) = -1;

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
	}

	cout << "[ result ]" << endl
		<< "- x" << endl << pdipm.Get_x() << endl
		<< "- lambda" << endl << pdipm.Get_lambda() << endl
		<< "- nu" << endl << pdipm.Get_nu() << endl
		<< "- residule : " << pdipm.Get_residule() << endl;

	return 0;
}
