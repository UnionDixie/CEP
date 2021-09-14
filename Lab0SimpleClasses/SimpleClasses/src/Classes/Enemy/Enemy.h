#pragma once

class Enemy
{
public:
	virtual void setAttack(int damage) = 0;
	virtual int Attack() = 0;
};

