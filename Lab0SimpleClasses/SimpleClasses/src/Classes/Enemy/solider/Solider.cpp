#include "Solider.h"

void Solider::setAttack(int damage)
{
	dmg = damage;
}

int Solider::Attack()
{
	return dmg;
}
