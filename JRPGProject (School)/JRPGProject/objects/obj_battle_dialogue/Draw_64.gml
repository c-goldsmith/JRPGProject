/// @description Draw to screen above others
//Copied from the object main menu 

// Temp font storage
draw_set_color(c_black);
var oldFont = draw_get_font();
draw_set_font(ft_basic);

draw_text(x+6, y+6, global.currentMessage);
// Reset color back to black

draw_set_color(c_black);


// Reset the font. ALWAYS HAVE AS LAST LINE
draw_set_font(oldFont);