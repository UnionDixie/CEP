#pragma once

#include "../Enemy.h"

class Solider : public Enemy
{
public:
	virtual void setAttack(int damage) override;
	virtual int Attack() override;
private:
	int dmg;
};

