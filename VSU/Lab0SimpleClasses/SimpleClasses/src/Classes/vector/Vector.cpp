#include "Vector.h"

#include <cmath>

void Vector2i::set(int x, int y)
{
	xy.setXY(x, y);
}

double Vector2i::Abs()
{
	return std::sqrt(xy.x() * xy.x() + xy.y() * xy.y());//sqrt(x^2+y^2)
}

int Vector2i::x()
{
	return xy.x();
}

int Vector2i::y()
{
	return xy.y();
}
