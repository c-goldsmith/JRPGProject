/// @description Draw to screen above others
//Copied from the object main menu 

// Temp font storage
var oldFont = draw_get_font();
draw_set_font(ft_basic);

// Draw the text
for (var i=0; i<4; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (battleMenuSelect = i) { // Set color
		draw_set_color(c_black);
		draw_text(x+6, y+6+(i*22), textToDisplay[i]+" <");
	} else {
		draw_set_color(c_grey);
		draw_text(x+6, y+6+(i*22), textToDisplay[i]);
	}
}

// Reset color back to black
draw_set_color(c_black);


// Reset the font. ALWAYS HAVE AS LAST LINE
draw_set_font(oldFont);