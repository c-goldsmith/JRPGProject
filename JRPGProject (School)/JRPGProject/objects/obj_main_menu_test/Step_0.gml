/// @description Checks every update

// Function for moving on to next scene when something is selected
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
	switch (mainMenuSelect) { // Switch for determining which button is pressed! Fill these in as we make them
		case 0: // Map
		
		break;
		
		case 1: // Area
		
		break;
		
		case 2: // Battle
		
		break;
		
		case 3: // Quit
			game_end(0); // Exit game
		break;
	}
}

// Change menu position on key press
if (keyboard_check_pressed(vk_up))		{ mainMenuSelect--; }
if (keyboard_check_pressed(vk_down))	{ mainMenuSelect++; }

// Loop menu position around to the top or bottom
if (mainMenuSelect > 3) { mainMenuSelect = 0; }
if (mainMenuSelect < 0) { mainMenuSelect = 3; }