#include <iostream>

#include <Eigen/Dense>

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

	MatrixXf b(4, 2);
	for (size_t row = 0; row < 4; row++) {
		b(row, 0) = 1;
		b(row, 1) = 2;
	}

	MatrixXf x = A.colPivHouseholderQr().solve(b);

	cout << x << endl;

	{
		//-------------------------------svd²âÊÔ    eigen
		Matrix3f A;
		A(0, 0) = 1, A(0, 1) = 0, A(0, 2) = 1;
		A(1, 0) = 0, A(1, 1) = 1, A(1, 2) = 1;
		A(2, 0) = 0, A(2, 1) = 0, A(2, 2) = 0;
		JacobiSVD<Eigen::MatrixXf> svd(A, ComputeThinU | ComputeThinV);
		Matrix3f V = svd.matrixV(), U = svd.matrixU();
		Matrix3f  S = U.inverse() * A * V.transpose().inverse(); // S = U^-1 * A * VT * -1
		std::cout << "A :\n" << A << std::endl;
		std::cout << "U :\n" << U << std::endl;
		std::cout << "S :\n" << S << std::endl;
		std::cout << "V :\n" << V << std::endl;
		std::cout << "U * S * VT :\n" << U * S * V.transpose() << std::endl;
		//-------------------------------svd²âÊÔ    eigen
	}

	return 0;
}
