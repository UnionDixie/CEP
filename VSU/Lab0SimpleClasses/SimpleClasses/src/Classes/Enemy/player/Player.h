#pragma once

#include <iostream>

#include "../Enemy.h"

class Player
{
public:
	void attack(Enemy& enemy);
	void printHp();
private:
	int hp = 100;
};

