#include "Rectangle.h"

#include "../Utils/Utils.h"

Rectangle::Rectangle(const Vector2f& point1, const Vector2f& size) :
	m_point(point1),
	m_size(size)
{
}

void Rectangle::move(const Vector2f& moveXY)
{
	m_point += moveXY;
}

void Rectangle::scale(const Vector2f& size)
{
	m_size += size;
}

void Rectangle::draw() const
{
	print("Left down corner\n");
	m_point.draw();
	print("Right up corner\n");
	Vector2f rigtUP = m_point + m_size;
	rigtUP.draw();
}

Rectangle Rectangle::intersect(const Rectangle& rect1, const Rectangle& rect2)
{
	return Rectangle();
}

Rectangle Rectangle::contains(const Rectangle& rect1, const Rectangle& rect2)
{
	float minX = std::min(rect1.minX(), rect2.minX());
	float minY = std::min(rect1.minY(), rect2.minY());
	float maxX = std::max(rect1.maxX(), rect2.maxX());
	float maxY = std::max(rect1.maxY(), rect2.maxY());

	return Rectangle(Vector2f(minX, minY), Vector2f(maxX - minX, maxY - minY));
}

float Rectangle::maxX() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float maxX = vector2fArray[0].x();

	for (size_t i = 0; i < n; i++)
		maxX = std::max(maxX, vector2fArray[i].x());

	return maxX;
}

float Rectangle::maxY() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float maxY = vector2fArray[0].y();

	for (size_t i = 0; i < n; i++)
		maxY = std::max(maxY, vector2fArray[i].y());

	return maxY;
}

float Rectangle::minX() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float minX = vector2fArray[0].x();

	for (size_t i = 0; i < n; i++)
		minX = std::min(minX, vector2fArray[i].x());

	return minX;
}

float Rectangle::minY() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float minY = vector2fArray[0].y();

	for (size_t i = 0; i < n; i++)
		minY = std::min(minY, vector2fArray[i].y());

	return minY;
}



