/// @description Create bestiary entries and manage them

// Bestiary constructor
function create_Bentry(b_name, b_desc, b_sprite, b_scanned, b_maxHP, b_attack, b_defense, b_location, b_itemdrops) constructor {
	name = b_name;
	description = b_desc;
	sprite = b_sprite;
	checkScan = b_scanned;
	max_HP = b_maxHP;
	attack = b_attack;
	defence = b_defense;
	location = b_location;
	item_drops = b_itemdrops;
}

global.bestiary_list = {
	battlerat : new create_Bentry(
		"battleRat",
		"A well-rounded, content rat.",
		spr_battleRat_test,
		true,
		50,
		10,
		2,
		"Battle Room",
		"None"
		
	),
	battlerat_brown : new create_Bentry(
		"battleRat_br",
		"A hungry, cautious rat.",
		spr_battleRat_test_brown,
		true,
		60,
		8,
		3,
		"Battle Room",
		"Apple core"
	),
	battlerat_yellow : new create_Bentry(
		"battleRat_y",
		"An energetic, feisty rat.",
		spr_battleRat_test_yellow,
		true,
		40,
		12,
		1,
		"Battle Room",
		"Banana peel"
	)
}

// Create the bestiary with nothing in it first
bestiary = array_create(0)
// Then put some entries in it
array_push(bestiary, global.bestiary_list.battlerat)
array_push(bestiary, global.bestiary_list.battlerat_brown)
array_push(bestiary, global.bestiary_list.battlerat_yellow)



