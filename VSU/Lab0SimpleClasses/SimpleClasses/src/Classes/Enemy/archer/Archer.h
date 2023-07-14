#pragma once

#include "../Enemy.h"

class Archer : public Enemy
{
public:
	virtual void setAttack(int damage) override;
	virtual int Attack() override;
private:
	int dmg;
};

