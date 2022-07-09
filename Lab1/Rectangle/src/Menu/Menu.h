#pragma once

#include <vector>
#include <string>

#include "../Rectangle/Rectangle.h"

class Menu
{
public:
	Menu() = default;
	~Menu() = default;
	void run();
	void setMenu(const std::vector<std::string>& menuItems);
	void draw(const int item);
private:
	void drawMenu();
	void drawInput();
	void drawMove();
	void drawScale();
	void drawContains();
	void drawIntersect();

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

	Rectangle m_r1, m_r2;
	Vector2f m_xy1, m_size1, m_xy2, m_size2;
	Vector2f m_move;
	int m_x;
};

