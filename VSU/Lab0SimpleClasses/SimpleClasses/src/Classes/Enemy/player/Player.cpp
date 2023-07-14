#include "Player.h"

void Player::attack(Enemy& enemy)
{
	hp -= enemy.Attack();
}

void Player::printHp()
{
	std::cout << "Hp: " << hp << "\n";
}
