/// @description Checks every update

// The vars for checking key presses
var up_key_pressed = keyboard_check_pressed(vk_up);
var down_key_pressed = keyboard_check_pressed(vk_down);
var space_key_pressed = keyboard_check_pressed(vk_space);
var z_key_pressed = keyboard_check_pressed(ord("Z"));

// Get menu length of current submenu
pauseMenuLength = array_length(pauseMenuText[pauseMenuLevel]);

// Move up or down the submenu
pauseMenuPos += down_key_pressed - up_key_pressed;
if pauseMenuPos >= pauseMenuLength {pauseMenuPos = 0};
if pauseMenuPos < 0 {pauseMenuPos = pauseMenuLength - 1};


// Statement for selecting a highlighted option for each submenu
if (space_key_pressed || z_key_pressed) {
	switch (pauseMenuLevel) {
		case 0: /* First submenu */
			switch(pauseMenuPos) {
				case 0: /* Party */
					pauseMenuLevel = 1; break; 
				case 1: /* Inventory */ 
					pauseMenuLevel = 2; break;
				case 2: /* Bestiary */
					pauseMenuLevel = 3; break;
				case 3: /* Quit */ 
					room_goto(rm_start_test); break;
			}
			break;
		case 1: /* Party */
			switch (pauseMenuPos) {
				case 0: break;
				case 1: break;
				case 2: break;
				case 3: break;
				case 4: /* Back */ pauseMenuLevel = 0; pauseMenuPos = 0; break;
			}
			break;
		case 2: /* Inventory */
			switch (pauseMenuPos) {
				case 0: break;
				case 1: break;
				case 2: break;
				case 3: /* Back */ pauseMenuLevel = 0; pauseMenuPos = 1; break;
			}
			break;
		case 3: /* Bestiary */
			switch (pauseMenuPos) {
				case 0: break;
				case 1: break;
				case 2: break;
				case 3: break;
				case 4: /* Back */ pauseMenuLevel = 0; pauseMenuPos = 2; break;
			}
			break;
	}
	// Get Menu Length of New SubMenu, important for Draw GUI to
	// Stay within bounds
	pauseMenuLength = array_length(pauseMenuText[pauseMenuLevel]);
}