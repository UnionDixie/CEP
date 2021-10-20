#pragma once

class Vector2f
{
public:
	Vector2f() = default;
	Vector2f(const float x, const float y);
	Vector2f(const Vector2f& vector);
	friend Vector2f operator+(const Vector2f& a, const Vector2f& b);
	Vector2f& operator+=(const Vector2f& other);
	~Vector2f() = default;
	float& x();
	float& y();
	float x() const;
	float y() const;
	void draw() const;
private:
	float m_x = 0.f, m_y = 0.f;
};

