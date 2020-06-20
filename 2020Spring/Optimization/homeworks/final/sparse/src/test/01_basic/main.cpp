#include <iostream>

#include <Util.h>

using namespace std;
using namespace Eigen;

int main() {
	MatrixXf A(4, 4);

	float data[4][4] = {
		{1, 0, 0, 0},
		{0, 1, 0, 0},
		{0, 0, 1, 0},
		{0, 0, 0, 1}
	};

	for (size_t row = 0; row < 4; row++) {
		for (size_t col = 0; col < 4; col++)
			A(row, col) = data[row][col];
	}
	
	cout << Ubpa::MutualCoherence(A) << endl;

	Eigen::VectorXf z(3);
	z[0] = -1;
	z[1] =  0;
	z[2] =  1;
	cout << Ubpa::Shrink(z, 0.5) << endl;

	cout << Ubpa::MoreauYosidaRegularization_Norm2(z, 0.5f) << endl;

	cout << Ubpa::MoreauYosidaRegularization_NormNuclear(A, 0.5f) << endl;

	return 0;
}
