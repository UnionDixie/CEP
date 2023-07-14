#include <iostream>

#include "../src/Classes/Enemy/player/Player.h"
#include "../src/Classes/Enemy/Enemy.h"
#include "../src/Classes/Enemy/archer/Archer.h"
#include "../src/Classes/Enemy/solider/Solider.h"

int main(void) {

	Player player;

	Archer arch;
	arch.setAttack(10);

	Solider soliders;
	soliders.setAttack(20);

	player.printHp();
	player.attack(soliders);
	player.printHp();
	player.attack(arch);
	player.printHp();

	return 0;
}