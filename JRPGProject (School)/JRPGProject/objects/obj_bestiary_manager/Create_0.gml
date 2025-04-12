/// @description Create bestiary entries and manage them

// Bestiary constructor
function create_Bentry(b_name, b_desc, b_sprite, b_scanned, b_maxHP, b_attack, b_defense) constructor {
	name = b_name;
	description = b_desc;
	sprite = b_sprite;
	checkScan = b_scanned;
	max_HP = b_maxHP;
	attack = b_attack;
	defence = b_defense;
}

global.bestiary_list = {
	battlerat : new create_Bentry(
		"battleRat",
		"It's a placeholder!",
		spr_battleRat_test,
		true,
		50,
		10,
		0
	)
}

// Create the bestiary with nothing in it first
bestiary = array_create(0)
// Then put an entry in it
array_push(bestiary, global.bestiary_list.battlerat)



