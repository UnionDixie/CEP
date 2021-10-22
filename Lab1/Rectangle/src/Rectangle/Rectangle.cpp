#include "Rectangle.h"

#include "../Utils/Utils.h"

Rectangle::Rectangle(const Vector2f& point, const Vector2f& size) :
	m_point(point),
	m_size(size)
{
}

void Rectangle::setRect(const Vector2f& point, const Vector2f& size)
{
	m_point = point;
	m_size = size;
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

std::vector<Vector2f> Rectangle::vertices() const
{
	std::vector<Vector2f> vertices(4);//

	vertices[0] = m_point;
	vertices[1] = m_point + Vector2f(m_size.x(), 0);
	vertices[2] = m_point + Vector2f(0, m_size.y());
	vertices[3] = m_point + m_size;

	return vertices;
}

Rectangle Rectangle::intersect(const Rectangle& rect1, const Rectangle& rect2)
{
	const std::vector<Vector2f> vertices1 = rect1.vertices();
	const std::vector<Vector2f> vertices2 = rect2.vertices();

	const Vector2f& a = vertices1[0];
	const Vector2f& b = vertices1[3];

	const Vector2f& c = vertices2[0];
	const Vector2f& d = vertices2[3];

	float left = std::max(a.x(), c.x());
	float top = std::min(b.y(), d.y());
	float right = std::min(b.x(), d.x());
	float bottom = std::max(a.y(), c.y());

	float width = right - left;
	float Height = top - bottom;

	if (width == 0 || Height == 0) 
		print("Not Found intersect\n");

	return Rectangle(Vector2f(left, bottom), Vector2f(width, Height));
}

Rectangle Rectangle::contains(const Rectangle& rect1, const Rectangle& rect2)
{
	float minX = std::min(rect1.minXY().first, rect2.minXY().first);
	float minY = std::min(rect1.minXY().second, rect2.minXY().second);
	float maxX = std::max(rect1.maxXY().first, rect2.maxXY().first);
	float maxY = std::max(rect1.maxXY().second, rect2.maxXY().second);

	return Rectangle(Vector2f(minX, minY), Vector2f(maxX - minX, maxY - minY));
}

std::pair<float, float> Rectangle::maxXY() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float maxX = vector2fArray[0].x();
	float maxY = vector2fArray[0].y();

	for (size_t i = 0; i < n; i++) {
		maxX = std::max(maxX, vector2fArray[i].x());
		maxY = std::max(maxY, vector2fArray[i].y());
	}

	return { maxX, maxY };
}

std::pair<float, float> Rectangle::minXY() const
{
	const int n = 4;
	Vector2f vector2fArray[4];

	vector2fArray[0] = m_point;
	vector2fArray[1] = m_point + Vector2f(m_size.x(), 0);
	vector2fArray[2] = m_point + Vector2f(0, m_size.y());
	vector2fArray[3] = m_point + m_size;

	float minX = vector2fArray[0].x();
	float minY = vector2fArray[0].y();

	for (size_t i = 0; i < n; i++) {
		minX = std::min(minX, vector2fArray[i].x());
		minY = std::min(minY, vector2fArray[i].y());
	}

	return { minX, minY };
}



