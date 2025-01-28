/// @description Draw to screen above others

// Draw the text
for (var i=0; i<4; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (battleMenuSelect = i) { // Set color
		draw_set_color(c_lime);	
	} else {
		draw_set_color(c_green);
	}
	
	// Draw text
	draw_text(x+6, y+6+(i*22), battleText[i]);
}

// Reset color back to black
draw_set_color(c_black);