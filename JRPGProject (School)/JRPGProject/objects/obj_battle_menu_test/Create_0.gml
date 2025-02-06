/// @description Checks when created

// Set up variables
battleMenuSelect = 0; // For determining which of the three main menus this one is.
spellMenuSelect = 0;
onSpellMenu = 0;
draw_set_color(c_black); // Sets default text drawing color

battleText = [
	"Attack",
	"Magic",
	"Defend",
	"Exit"
];

spellText = [
	"Scan",
	"Heal",
	"Fireball",
	"Back"
];

textToDisplay = battleText;

