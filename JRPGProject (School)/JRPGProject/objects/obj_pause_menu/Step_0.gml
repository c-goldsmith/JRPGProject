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

//var descBox = instance_create_layer(20, 20, "Instances", obj_item_desc);

// Statement for selecting a highlighted option for each submenu
if (space_key_pressed || z_key_pressed) {
	if (pauseMenuLevel == 0) {
		// First sublevel
		if (pauseMenuPos == 0) {pauseMenuLevel = 1;}
		else if (pauseMenuPos == 1) {pauseMenuLevel = 2;}
		else if (pauseMenuPos == 2) {pauseMenuLevel = 3;}
		else if (pauseMenuPos == 3) {room_goto(rm_start_test);}
	}
	else if (pauseMenuLevel == 1) {
		// Party
		if (pauseMenuPos == 4) {pauseMenuLevel = 0; pauseMenuPos = 0;}
	}
	else if (pauseMenuLevel == 2) {
		// Inventory
		if (pauseMenuPos == (inv_length)) {pauseMenuLevel = 0; pauseMenuPos = 1;}
	}
	else if (pauseMenuLevel == 3) {
		// Bestiary
		if (pauseMenuPos == 4) {pauseMenuLevel = 0; pauseMenuPos = 2;}
	}

	
	// Get Menu Length of New SubMenu, important for Draw GUI to
	// Stay within bounds
	pauseMenuLength = array_length(pauseMenuText[pauseMenuLevel]);
}