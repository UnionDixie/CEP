#include "Archer.h"

void Archer::setAttack(int damage)
{
	dmg = damage;
}

int Archer::Attack()
{
	return dmg;
}
