/// @description Draw to screen above others

// Draw the text
for (var i=0; i<4; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (mainMenuSelect = i) { // Set color
		draw_set_color(c_lime);	
	} else {
		draw_set_color(c_green);
	}
	
	// Draw text
	draw_text(x+6, y+6+(i*22), menuText[i]);
}

for (var i=0; i<4; i++) { // Sets color based on current text position, then draws that row of text.
	
	draw_set_color(c_green);
	
	// Draw text
	draw_text(x+6, y+124+(i*22), creditsText[i]);
}

// Reset color back to black
draw_set_color(c_black);