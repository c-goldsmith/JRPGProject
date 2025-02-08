/// @description Checks when created

// Set up variables
xDiff = x - camera_get_view_x(view_camera[0]);
yDiff = y - camera_get_view_y(view_camera[0]);
currentx = 0; // current x position
currenty = 0; // current y position
visible = false; // This menu needs to stay hidden unitl
				 // the escape key is pressed
checkGamePause = 0; // initial pause menu position of highlighted text
pauseMenuSelect = 0; // For determining which option gets highlighted
					 // when the game is paused
					
draw_set_color(c_black); // Sets default text drawing color

pauseMenuText = [
	"Party",
	"Inventory",
	"Bestiary",
	"Quit"
];