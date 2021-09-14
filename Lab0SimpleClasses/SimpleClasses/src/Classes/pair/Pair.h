#pragma once

template<typename T1, typename T2>
class Pair
{
public:
    void setValue(const T1& a, const T2& b);
	T1& first();
	T2& second();
private:
	T1 x;
	T2 y;
};


template<typename T1, typename T2>
inline void Pair<T1, T2>::setValue(const T1& a, const T2& b)
{
	x = a;
	y = b;
}

template<typename T1, typename T2>
inline T1& Pair<T1, T2>::first()
{
	return x;
}

template<typename T1, typename T2>
inline T2& Pair<T1, T2>::second()
{
	return y;
}
