#pragma once

#include "point/Point.h"

class Vector2i
{
public:
	void set(int x, int y);
	double Abs();
	int x();
	int y();
private:
	Point xy;
};

