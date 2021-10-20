#pragma once

#include <vector>
#include <string>

class Menu
{
public:
	Menu() = default;
	~Menu() = default;
	void setMenu(const std::vector<std::string>& menuItems);
	void draw(const int item);
private:
	std::vector<std::string> m_menuItems;
};

