#pragma once

#include <vector>
#include <string>

#include "../Menu/Menu.h"

class App
{
public:
	App() = default;
	~App() = default;
	void run();
private:
	Menu m_menu;
	std::vector<std::string> m_items;
};

