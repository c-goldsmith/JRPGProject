 /// @description Checks every update

// Function for moving on to next scene when something is selected

//turns visible once dialogue box is done
if(visible == 0 && global.messageToShow == 0)
{
	visible = 1;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) && visible) {
	
	switch (battleMenuSelect) { // Switch for determining which button is pressed! Fill these in as we make them
		case 0: // Attack or Scan
			if(onSpellMenu == 0)
			{
				global.moveID = 5;
			} else {
				if(global.activeParty = 0) global.moveID = 2;
				if(global.activeParty = 1) global.moveID = 8;
				onSpellMenu = 0;
				textToDisplay = battleText;	
			}
			visible = 0;
			battleMenuSelect = 0;
			
		break;
		
		case 1: // Magic or Heal
			if(onSpellMenu == 0)
			{
				battleMenuSelect = 0;
				onSpellMenu = 1;
				if(global.activeParty = 0) textToDisplay = spellText1;
				if(global.activeParty = 1) textToDisplay = spellText2;
			} else {
				if(global.activeParty = 0) global.moveID = 3;
				if(global.activeParty = 1) global.moveID = 4;
				visible = 0;
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
			battleMenuSelect = 0;
		
		break;
		
		case 2: // Defend or Fireball
			if(onSpellMenu == 0)
			{
				visible = 0;
				global.moveID = 1;
			} else {
				if(global.activeParty = 0) global.moveID = 6;
				if(global.activeParty = 1) global.moveID = 7;
				visible = 0;
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
			battleMenuSelect = 0;
		break;
		
		case 3: // Exit to main menu - this will be replaced with run 
			if(onSpellMenu == 0)
			{
				room_goto(rm_start_test) // Exit battle
			} else {
				battleMenuSelect = 0;
				onSpellMenu = 0;
				textToDisplay = battleText;
			}
			battleMenuSelect = 0;
		break;
	}
}

// Change menu position on key press
if (keyboard_check_pressed(vk_up)||(keyboard_check_pressed(ord("W"))))	{ battleMenuSelect--; }
if (keyboard_check_pressed(vk_down)||(keyboard_check_pressed(ord("S"))))	{ battleMenuSelect++; }

// Loop menu position around to the top or bottom
if (battleMenuSelect > 3) { battleMenuSelect = 0; }
if (battleMenuSelect < 0) { battleMenuSelect = 3; }