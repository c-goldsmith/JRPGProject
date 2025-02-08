/// @description Checks every update

currentx = camera_get_view_x(view_camera[0]);
currenty = camera_get_view_y(view_camera[0]);

x = currentx + xDiff;
y = currenty + yDiff;

// Function for selecting a highlighted option
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
	switch (pauseMenuSelect) { // Switch for determining which button is pressed! Fill these in as we make them
	
		case 0: // Party - displays your party
		
		break;
		
		case 1: // Inventory - check your items
			
		break;
		
		case 2: // Bestiary - look at scanned entries
		
		break;
		
		case 3: // Quit - self explanatory
			room_goto(rm_start_test); // go back to main menu
		break;
	}
}

// Change menu position on key press
if (keyboard_check_pressed(vk_up))		{ pauseMenuSelect--; }
if (keyboard_check_pressed(vk_down))	{ pauseMenuSelect++; }

// Loop menu position around to the top or bottom
if (pauseMenuSelect > 3) { pauseMenuSelect = 0; }
if (pauseMenuSelect < 0) { pauseMenuSelect = 3; }