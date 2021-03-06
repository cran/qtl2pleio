#include <Rcpp.h>
#include <Eigen/Eigenvalues>

using namespace Rcpp;
using namespace Eigen;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//


// [[Rcpp::export]]
Eigen::MatrixXd rcppeigen_sqrt(const Eigen::Map<Eigen::MatrixXd> & A){
  SelfAdjointEigenSolver<MatrixXd> es(A);
  MatrixXd sqrtA = es.operatorSqrt();
  return sqrtA;
}

// [[Rcpp::export]]
Eigen::MatrixXd rcppeigen_invsqrt(const Eigen::Map<Eigen::MatrixXd> & A){
  SelfAdjointEigenSolver<MatrixXd> es(A);
  MatrixXd invsqrtA = es.operatorInverseSqrt();
  return invsqrtA;
}





// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R
timesTwo(42)
rcppeigen_sqrt(diag(c(2, 2)))
*/
