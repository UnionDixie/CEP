#pragma once

#include <vector>

#include "../Vector2f/Vector2f.h"

class Rectangle
{
public:
	Rectangle() = default;
	Rectangle(
		const Vector2f& point,
		const Vector2f& size);
	~Rectangle() = default;
	void setRect(
		const Vector2f& point,
		const Vector2f& size);
	void move(const Vector2f& moveXY);
	void scale(const Vector2f& size);
	void draw() const;
	std::vector<Vector2f> vertices() const;
public:
	static Rectangle intersect(const Rectangle& rect1, const Rectangle& rect2);
	static Rectangle contains(const Rectangle& rect1, const Rectangle& rect2);
private:
	std::pair<float, float> maxXY() const;
	std::pair<float, float> minXY() const;

private:
	Vector2f m_point, m_size;
};

