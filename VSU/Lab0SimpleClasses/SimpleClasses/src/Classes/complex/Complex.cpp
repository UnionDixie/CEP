#include "Complex.h"

#include <sstream>

void Complex::setValue(double Real, double Imag)
{
    RealValue = Real;
    ImagValue = Imag;
}

double Complex::real()
{
    return RealValue;
}

double Complex::imag()
{
    return ImagValue;
}

Complex Complex::ñonj()
{
    Complex conjugate;
    conjugate.setValue(RealValue, -ImagValue);
    return conjugate;
}

std::ostream& operator<<(std::ostream& out, const Complex& point)
{
    out << "Complex(" << point.RealValue << ", " << point.ImagValue << ")";
	return out;
}
