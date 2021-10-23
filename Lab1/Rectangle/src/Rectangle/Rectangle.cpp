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
	print("Left down point\n");
	m_point.draw();

	print("Right up point\n");
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

	const float left = std::max(a.x(), c.x());
	const float top = std::min(b.y(), d.y());
	const float right = std::min(b.x(), d.x());
	const float bottom = std::max(a.y(), c.y());

	const float width = right - left;
	const float Height = top - bottom;

	if (width == 0 || Height == 0) 
		print("Not Found intersect\n");

	return Rectangle(Vector2f(left, bottom), Vector2f(width, Height));
}

Rectangle Rectangle::contains(const Rectangle& rect1, const Rectangle& rect2)
{
	auto min = [](float a, float b) {
		return std::min(a, b);
	};
	auto max = [](float a, float b) {
		return std::max(a, b);
	};

	float minX = std::min(rect1.findXY(min).x(), rect2.findXY(min).x());
	float minY = std::min(rect1.findXY(min).y(), rect2.findXY(min).y());
	float maxX = std::max(rect1.findXY(max).x(), rect2.findXY(max).x());
	float maxY = std::max(rect1.findXY(max).y(), rect2.findXY(max).y());

	return Rectangle(Vector2f(minX, minY), Vector2f(maxX - minX, maxY - minY));
}

Vector2f Rectangle::findXY(const std::function<float(float, float)>& comp) const
{
	const std::vector<Vector2f> m_vertices = vertices();

	float maxX = m_vertices[0].x();
	float maxY = m_vertices[0].y();

	const int n = 4;
	for (size_t i = 0; i < n; i++) {
		maxX = comp(maxX, m_vertices[i].x());
		maxY = comp(maxY, m_vertices[i].y());
	}

	return { maxX, maxY };
}




