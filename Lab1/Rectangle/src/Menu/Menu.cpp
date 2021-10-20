#include "Menu.h"

#include "../Utils/Utils.h"

#include <iostream>

void Menu::setMenu(const std::vector<std::string>& menuItems)
{
	m_menuItems = menuItems;
}

void Menu::draw(const int item)
{
	print(m_menuItems[item] + '\n');
}
