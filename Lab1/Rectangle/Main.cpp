#include "src/App/App.h"

#include "tests/RectangleTest.h"

int main(void)
{
	RectangleTest::runAllTests();

	App app;
	app.run();

	return 0;
}
