/// @description Checks every update

var currentx = camera_get_view_x(view_camera[0]); // current x position
var currenty = camera_get_view_y(view_camera[0]); // current y position

x = currentx + xDiff;
y = currenty + yDiff;

// Get inputs
var up_key_pressed = keyboard_check_pressed(vk_up);
var down_key_pressed = keyboard_check_pressed(vk_down);
var space_key_pressed = keyboard_check_pressed(vk_space);
var z_key_pressed = keyboard_check_pressed(ord("Z"));

// Get menu length of current submenu
pauseMenuLength = array_length(pauseMenuText[pauseMenuLevel]);

// Move up or down the submenu
pauseMenuPos += up_key_pressed - down_key_pressed;
if pauseMenuPos >= pauseMenuLength {pauseMenuPos = 0};
if pauseMenuPos < 0 {pauseMenuPos = pauseMenuLength - 1};

// Function for selecting a highlighted option
if (space_key_pressed || z_key_pressed) {
	switch (pauseMenuLevel) {
		// first pause menu, need to continue to refactor
		case 0:
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			room_goto(rm_start_test);
			break;
	}
}