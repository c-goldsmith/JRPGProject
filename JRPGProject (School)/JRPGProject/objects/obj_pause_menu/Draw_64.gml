/// @description Draw the Pause Menu GUI
// Temp font storage
var oldFont = draw_get_font();
draw_set_font(ft_basic);

// Dynamically size the pause menu sprite based on Menu Level
var get_string_w = 0;
var temp_string_w = 0;

for (var i=0; i<pauseMenuLength; i++) {
	get_string_w = string_width(pauseMenuText[pauseMenuLevel,i]+" <");
	if (temp_string_w < get_string_w) { temp_string_w = get_string_w; }
}
var new_sprite_w = temp_string_w+25; // new sprite width
var new_sprite_h = (pauseMenuLength*22)+10; // new sprite heigth

var dx = 43; // where to draw the sprite at x corrdinate
var dy = 25; // where to draw the sprite at y coordinate
var xs = new_sprite_w/sprite_width; // xscale of sprite
var ys = new_sprite_h/sprite_width; // yscale of sprite

global.pausetest_arg7 = xs; 
global.pausetest_arg8 = ys;

draw_sprite_ext(sprite_index,image_index,dx,dy,xs,ys,0,c_white,1);

// Draw the text
for (var i=0; i<pauseMenuLength; i++) { // Sets color based on current text position, then draws that row of text.
	
	if (pauseMenuPos = i) { // Set color
		draw_set_color(c_black); // Highlighted color
		draw_text(55, 30+(i*22), pauseMenuText[pauseMenuLevel,i]+" <");
		global.itemI = i
		global.bestiI = i;
	} else {
		draw_set_color(c_grey); // Not highlighted color
		draw_text(55, 30+(i*22), pauseMenuText[pauseMenuLevel,i]);
	}

}
checki = i; // Store i's value for testing

// Reset color back to black
draw_set_color(c_black);

// Reset the font. ALWAYS HAVE AS LAST LINE
draw_set_font(oldFont);