#include "Point.h"

void Point::setXY(int x, int y)
{
	m_x = x;
	m_y = y;
}

int Point::x()
{
	return m_x;
}

int Point::y()
{
	return m_y;
}
