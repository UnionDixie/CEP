#pragma once

#include <iostream>

class Complex
{
public:
	void setValue(double Real, double Imag);
	double real();
	double imag();
	Complex ñonj();
	friend std::ostream& operator<< (std::ostream& out, const Complex& point);
private:
	double RealValue = 0, ImagValue = 0;
};

