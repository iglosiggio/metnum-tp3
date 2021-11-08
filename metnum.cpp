#include <Eigen/Dense>
#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>

namespace py=pybind11;

using Matrix = Eigen::MatrixXd;
using Vector = Eigen::VectorXd;

// https://eigen.tuxfamily.org/dox-devel/group__LeastSquares.html#title2
Vector least_squares(const Matrix& a, const Vector& b) {
	return (a.transpose() * a).ldlt().solve(a.transpose() * b);
}

PYBIND11_MODULE(metnum, m) {
	m.def(
		"least_squares", &least_squares,
		"Calculates the solution to a least-squares problem",
		py::arg("a"),
		py::arg("b")
	);
}
