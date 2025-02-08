// if Escape key is pressed in the overworld,
// it should set the game to be paused

if (!checkGamePause) {
	checkGamePause = true;
	instance_deactivate_all(true); // deactivate other objects
	
	pauseMenuSelect = 0; // The first menu option is highlighted
	if (!visible) {
		visible = true; // pause menu is now visible
	}
	
}
else {
	checkGamePause = false;
	instance_activate_all(); // activate other objects
	if (visible) {
		visible = false; // pause menu is now invisible
	}
}