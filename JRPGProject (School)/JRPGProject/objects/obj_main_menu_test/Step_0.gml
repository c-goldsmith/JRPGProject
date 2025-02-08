/// @description Checks every update

// Function for moving on to next scene when something is selected
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
	switch (mainMenuSelect) { // Switch for determining which button is pressed! Fill these in as we make them
		case 0: // Map
			room_goto(rm_map_1); // Go to the first big map room
			
		break;
		
		case 1: // Area
		
		break;
		
		case 2: // Battle
			room_goto(rm_battle_test); // Go to the battle test room
		break;
		
		case 3: // Quit
			game_end(0); // Exit game
		break;
	}
}

// Change menu position on key press
if ((keyboard_check_pressed(vk_up)) || (keyboard_check_pressed(ord("W"))))		{ mainMenuSelect--; }
if ((keyboard_check_pressed(vk_down)) || (keyboard_check_pressed(ord("S"))))	{ mainMenuSelect++; }

// Loop menu position around to the top or bottom
if (mainMenuSelect > 3) { mainMenuSelect = 0; }
if (mainMenuSelect < 0) { mainMenuSelect = 3; }