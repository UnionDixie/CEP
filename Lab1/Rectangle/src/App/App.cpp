#include "App.h"

#include <iostream>

void App::run()
{
	m_items = { "\tMenu\n" };

	m_menu.setMenu(m_items);

	while (true)
	{
		m_menu.draw(0);
		int x;
		std::cin >> x;

		system("cls");
	}

}
