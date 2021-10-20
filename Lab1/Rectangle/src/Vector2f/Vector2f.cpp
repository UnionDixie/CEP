#include "Vector2f.h"

#include "../Utils/Utils.h"

Vector2f::Vector2f(const float x, const float y) :
	m_x(x), m_y(y)
{
}

Vector2f::Vector2f(const Vector2f& vector) :
	m_x(vector.x()),
	m_y(vector.y())
{
}

Vector2f& Vector2f::operator+=(const Vector2f& other)
{
	*this = *this + other;
	return *this;
}

float& Vector2f::x()
{
	return m_x;
}

float& Vector2f::y()
{
	return m_y;
}

float Vector2f::x() const
{
	return m_x;
}

float Vector2f::y() const
{
	return m_y;
}

void Vector2f::draw() const
{
	std::string message =
		"X:" + std::to_string(m_x) + ",Y:" + std::to_string(m_y) + '\n';
	print(message);
}

Vector2f operator+(const Vector2f& a, const Vector2f& b)
{
	Vector2f tmp(a);
	tmp.m_x += b.x();
	tmp.m_y += b.y();
	return tmp;
}
