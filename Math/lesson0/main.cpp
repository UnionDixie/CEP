#include "Eigen/Core"
#include "WNewton/wnewton.h"
#include "WNewton/lambdajacobiandenseproblem.h"

int main()
{
    const auto residualsFunc = [](const Eigen::VectorXd &variables, Eigen::VectorXd &residuals) {
        residuals.resize(1);
        residuals[0] = variables[0] * variables[0] - 1.0;
    };

    const auto jacobianFunc = [](const Eigen::VectorXd &variables, Eigen::MatrixXd &jacobian) {
        jacobian.resize(1, 1);
        jacobian(0, 0) = 2 * variables[0];
    };

    WNewton::LambdaJacobianDenseProblemd problem(residualsFunc, jacobianFunc);
    Eigen::VectorXd vars(1);
    vars << 0.1;

    WNewton::performNewton<Eigen::LDLT<Eigen::MatrixX<double>>>(
                problem,
                vars,
                WNewton::Settings(10, 0.5, false),
                WNewton::OptimizationThresholds(1e-10, 1e-10),
                nullptr);

    std::cout << vars;

    return 0;
}
