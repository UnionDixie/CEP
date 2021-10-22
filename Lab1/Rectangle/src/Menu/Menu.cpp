#include "Menu.h"

#include <iostream>

#include "../Utils/Utils.h"
#include "../Rectangle/Rectangle.h"


void Menu::run()
{

	Rectangle r1, r2;
	Vector2f xy1, size1, xy2, size2;
	Vector2f move;
	int x;

	m_state = MenuState::isMenu;

	while (m_state != MenuState::Exit)
	{

		switch (m_state)
		{
		case MenuState::isMenu:
			draw(m_state);
			std::cin >> x;
			if (x >= 1 && x <= 6) {
				m_state = (MenuState)(x);
			}
			//draw them
			break;
		case MenuState::Inputting:
			draw(m_state);
			std::cin >> xy1 >> size1 >> xy2 >> size2;
			r1.setRect(xy1, size1);
			print("\n");
			r2.setRect(xy2, size2);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Move:
			draw(m_state);
			std::cin >> x >> move;
			if (x == 1)
				r1.move(move);
			else if (x == 2)
				r2.move(move);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Scale:
			draw(m_state);
			std::cin >> x >> size1;
			if (x == 1)
				r1.scale(size1);
			else if (x == 2)
				r2.scale(size1);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Contains:
			draw(m_state);
			r1.draw();
			print("\n");
			r2.draw();
			print("\n");
			Rectangle::contains(r1, r2).draw();
			std::cin >> x;
			if (x == 0)
				m_state = MenuState::Abort;
			else
				m_state = MenuState::Contains;
			break;
		case MenuState::Intersect:
			draw(m_state);
			r1.draw();
			print("\n");
			r2.draw();
			print("\n");
			Rectangle::intersect(r1, r2).draw();
			std::cin >> x;
			if (x == 0)
				m_state = MenuState::Abort;
			else
				m_state = MenuState::Intersect;
			break;
		case MenuState::Abort:
			m_state = MenuState::isMenu;
			break;
		case MenuState::Exit:
			break;
		default:
			break;
		}
		system("cls");
	}
}

void Menu::setMenu(const std::vector<std::string>& menuItems)
{
	m_menuItems = menuItems;
}

void Menu::draw(const int item)
{
	print(m_menuItems[item] + '\n');
}
