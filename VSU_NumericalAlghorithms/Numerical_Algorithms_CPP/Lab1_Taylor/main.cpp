#include <iostream>
#include <cmath>

float y_func(const float x)
{
	return std::sin(x);
}

int main()
{
	using namespace std;

	const int degree = 30;
	const float eps = 1e-5;

	cout << "Degree:" << degree << ", "
		<< "EPS:" << eps << ", "
		<< "Function:sin(x)" << "\n"; 

	const float degree_radian = (degree * M_PI) / 180.0f;



	return 0;
}