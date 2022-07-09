#include "Menu.h"

#include "../Utils/Utils.h"

void Menu::run()
{
	m_state = MenuState::isMenu;

	while (m_state != MenuState::Exit)
	{
		switch (m_state)
		{
		case MenuState::isMenu:
			drawMenu();
			break;
		case MenuState::Inputting:
			drawInput();
			break;
		case MenuState::Move:
			drawMove();
			break;
		case MenuState::Scale:
			drawScale();
			break;
		case MenuState::Contains:
			drawContains();
			break;
		case MenuState::Intersect:
			drawIntersect();
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

void Menu::drawMenu()
{
	draw(m_state);
	std::cin >> m_x;
	if (m_x >= 1 && m_x <= 6)
		m_state = static_cast<MenuState>(m_x);
}

void Menu::drawInput()
{
	draw(m_state);
	std::cin >> m_xy1 >> m_size1 >> m_xy2 >> m_size2;

	m_r1.setRect(m_xy1, m_size1);
	print("\n");
	m_r2.setRect(m_xy2, m_size2);

	while (m_x != 0)
		std::cin >> m_x;

	m_state = MenuState::isMenu;
}

void Menu::drawMove()
{
	draw(m_state);

	std::cin >> m_x >> m_move;

	print("Was\n");

	if (m_x == 1) {
		m_r1.draw();
		print("\n");
		m_r1.move(m_move);
		print("Now\n");
		m_r1.draw();
	}
	else if (m_x == 2) {
		m_r2.draw();
		m_r2.move(m_move);
		print("Now\n");
		m_r2.draw();
	} else {
		print("Error\n");
		return;
	}
		
	while (m_x != 0)
		std::cin >> m_x;

	m_state = MenuState::Abort;
}

void Menu::drawScale()
{
	draw(m_state);
	std::cin >> m_x >> m_size1;

	print("Was\n");

	if (m_x == 1) {
		m_r1.draw();
		print("\n");
		m_r1.scale(m_size1);
		print("Now\n");
		m_r1.draw();
	}
	else if (m_x == 2) {
		m_r2.draw();
		print("\n");
		m_r2.scale(m_size1);
		print("Now\n");
		m_r2.draw();
	} else {
		print("Error\n");
		return;
	}

	while (m_x != 0)
		std::cin >> m_x;

	m_state = MenuState::Abort;
}

void Menu::drawContains()
{
	draw(m_state);
	print("First Rectangle\n");
	m_r1.draw();
	print("\n");
	print("Second Rectangle\n");
	m_r2.draw();
	print("\n");
	print("Result:\n");
	Rectangle::contains(m_r1, m_r2).draw();

	while (m_x != 0)
		std::cin >> m_x;

	m_state = MenuState::Abort;
}

void Menu::drawIntersect()
{
	draw(m_state);
	print("First Rectangle\n");
	m_r1.draw();
	print("\n");
	print("Second Rectangle\n");
	m_r2.draw();
	print("\n");
	print("Result:\n");
	Rectangle::intersect(m_r1, m_r2).draw();
	
	while (m_x != 0)
		std::cin >> m_x;

	m_state = MenuState::Abort;
}
