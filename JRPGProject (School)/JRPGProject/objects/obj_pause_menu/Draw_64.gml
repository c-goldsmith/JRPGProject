/// @description Draw to screen above others

// Draw the text
for (var i=0; i<pauseMenuLength; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (pauseMenuPos = i) { // Set color
		draw_set_color(c_lime);	
	} else {
		draw_set_color(c_green);
	}
	
	// Draw text
	draw_text(50, 40+(i*22), pauseMenuText[i]);
}

// Reset color back to black
draw_set_color(c_black);