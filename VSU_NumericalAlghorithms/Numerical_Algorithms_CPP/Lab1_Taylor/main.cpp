#include <iostream>
#include <cmath>
#include <numbers>
#include <iomanip>

// TAYLOR SIN(X)

float y_func(const float x)
{
	return std::sin(x);
}

int main()
{
	using namespace std;

	const int x = 30;
	const float eps = 1e-5;

	cout << "Degree:" << x << ", "
		<< "EPS:" << eps << ", "
		<< "Function:sin(x)" << "\n"; 

	const float x_radian = (x * std::numbers::pi_v<float>) / 180.0f;
	cout << "Degree_rad:" << x_radian << "\n";

	float sum = x_radian;
	float t = x_radian;
	float d = 3.0f;
	float xsq = x_radian * x_radian;
	int i = 1;

	//sin(x)=sigma x-x^3/3! -  ....

	while (abs(t) >= eps) {
		t = -t * xsq / (d * (d - 1.0));
		sum += t;
		d += 2;
		i++;
	}


	std::cout <<
		std::fixed << std::setprecision(5) << 
		sum << " " << 
		i << " " << 
		y_func(x_radian) << "\n";



	return 0;
}