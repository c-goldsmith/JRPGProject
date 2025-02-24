/// @description Draw the Pause Menu GUI

// Draw the text
for (var i=0; i<pauseMenuLength; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (pauseMenuPos = i) { // Set color
		draw_set_color(c_lime);	 // Highlighted color
	} else {
		draw_set_color(c_green); // Not highlighted color
	}
	
	// Draw text for the current submenu
	draw_text(50, 40+(i*22), pauseMenuText[pauseMenuLevel,i]);
}

// Reset color back to black
draw_set_color(c_black);