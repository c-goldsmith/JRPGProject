/// @description Draw the desc box and contents

// Set the position and size of the item description box
var dx = 43; // where to draw the sprite at x corrdinate
var dy = 200; // where to draw the sprite at y coordinate
var xs = 330/sprite_width; // xscale of sprite
var ys = 100/sprite_width; // yscale of sprite

// Temp font storage
var oldFont = draw_get_font();
draw_set_font(ft_basic);

// Draw the item description text and box
if (global.itemI < inv_length) {
	draw_sprite_ext(sprite_index,image_index,dx,dy,xs,ys,0,c_white,1);
	draw_set_color(c_black);
	draw_text(dx+10, dy+10, obj_item_manager.inventory[global.itemI].description);
}
// Note that this box will not be drawn if "Back" is highlighted