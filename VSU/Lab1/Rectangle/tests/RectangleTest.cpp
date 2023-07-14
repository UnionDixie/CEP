#include "RectangleTest.h"

#include "../src/Rectangle/Rectangle.h"
#include "../src/Utils/Utils.h"


void RectangleTest::runAllTests()
{
	test1();
}

void RectangleTest::test1()
{
	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		if (r1.vertices() == 
			std::vector<Vector2f>{ {1, 1}, { 2, 1 }, { 1, 2 }, { 2, 2 } })
			print("OkInit\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		r1.move(Vector2f(1, 1));
		if (r1.vertices() ==
			std::vector<Vector2f>{ {2, 2}, { 3, 2 }, { 2, 3 }, { 3, 3 } })
			print("OkMove\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		r1.scale(Vector2f(1, 1));
		if (r1.vertices() ==
			std::vector<Vector2f>{ {2, 2}, { 4, 3 }, { 3, 4 }, { 4, 4 } })
			print("OkScale\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		Rectangle r2(xy + Vector2f(-1, -1), size + Vector2f(1, 1));
		if (Rectangle::contains(r1, r2).vertices() ==
			std::vector<Vector2f>{ {0, 0}, { 2, 0 }, { 0, 2 }, { 2, 2 } })
			print("OkContains\n");
	}


	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		Rectangle r2(xy + Vector2f(-1, -1), size + Vector2f(1, 1));
		if (Rectangle::intersect(r1, r2).vertices() ==
			std::vector<Vector2f>{ {1, 1}, { 2, 1 }, { 1, 2 }, { 2, 2 } })
			print("OkIntersect\n");
	}

	print("\n\n");

}
