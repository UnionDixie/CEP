#include "App.h"



void App::run()
{
	m_items = { "\t\tMenu \
				 \n\t1)Input new two rectangles \
				 \n\t2)Move one of rectangles \
				 \n\t3)Scale one of rectangles \
				 \n\t4)Contains rectangles \
				 \n\t5)Intersect rectangles \
			     \n\t6)Exit\n",
				 "\t\tInput x,y and width and height rectangle, twice!\n",
				 "\t\tChose who move 1 or 2 and offset\n",
				 "\t\tChose who scale 1 or 2 and offset\n",
			     "\t\tContains, 0 to abort:\n",
				 "\t\tIntersect, 0 to abort:\n",
	};
	
	m_menu.setMenu(m_items);

	m_menu.run();

}
