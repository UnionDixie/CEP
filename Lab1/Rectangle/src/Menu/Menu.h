#pragma once

#include <vector>
#include <string>

class Menu
{
public:
	Menu() = default;
	~Menu() = default;
	void run();
	void setMenu(const std::vector<std::string>& menuItems);
	void draw(const int item);
private:
	enum MenuState
	{
		isMenu,
		Inputting,
		Move,
		Scale,
		Contains,
		Intersect,
		Exit,
		Abort
	};
	std::vector<std::string> m_menuItems;
	MenuState m_state;
};

