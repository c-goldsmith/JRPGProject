/// @description Checks every update

// Function for moving on to next scene when something is selected
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
	switch (battleMenuSelect) { // Switch for determining which button is pressed! Fill these in as we make them
		case 0: // Attack
			if(onSpellMenu == 0)
			{
				global.moveID = 1;
			} else {
				global.moveID = 3;
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
			
		break;
		
		case 1: // Magic
			if(onSpellMenu == 0)
			{
				onSpellMenu = 1;
				textToDisplay = spellText;
			} else {
				global.moveID = 4;
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
		
		break;
		
		case 2: // Defend
			
		break;
		
		case 3: // Exit to main menu - this will be replaced with run 
			if(onSpellMenu == 0)
			{
				room_goto(rm_start_test) // Exit battle
			} else {
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
		break;
	}
}

// Change menu position on key press
if (keyboard_check_pressed(vk_up))		{ battleMenuSelect--; }
if (keyboard_check_pressed(vk_down))	{ battleMenuSelect++; }

// Loop menu position around to the top or bottom
if (battleMenuSelect > 3) { battleMenuSelect = 0; }
if (battleMenuSelect < 0) { battleMenuSelect = 3; }