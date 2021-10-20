#pragma once

#include "../Vector2f/Vector2f.h"

class Rectangle
{
public:
	Rectangle() = default;
	Rectangle(
		const Vector2f& point,
		const Vector2f& size);
	~Rectangle() = default;
	void move(const Vector2f& moveXY);
	void scale(const Vector2f& size);
	void draw() const;
public:
	static Rectangle intersect(const Rectangle& rect1, const Rectangle& rect2);
	static Rectangle contains(const Rectangle& rect1, const Rectangle& rect2);
private:
	float maxX() const;
	float maxY() const;
	float minX() const;
	float minY() const;
private:
	Vector2f m_point, m_size;
};

