/// @description Draw the desc box and contents

// Set the position and size of the item description box
var dx = 180; // where to draw the sprite at x corrdinate
var dy = 80; // where to draw the sprite at y coordinate
var xs = 230/sprite_width; // xscale of sprite
var ys = 220/sprite_width; // yscale of sprite

// Temp font storage
var oldFont = draw_get_font();
draw_set_font(ft_basic);

// Draw the item description text and box
if (global.bestiI < bes_length) {
	// Draw description window
	draw_sprite_ext(sprite_index,image_index,dx,dy,xs,ys,0,c_white,1);
	draw_set_color(c_black);
	
	// Draw enemy sprite
	draw_sprite(obj_bestiary_manager.bestiary[global.bestiI].sprite, 0, dx+50, dy+50)
	
	// Draw the text
	var voffset = 22;
	draw_text(dx+120, dy+10+(0*voffset), "HP: "+string(obj_bestiary_manager.bestiary[global.bestiI].max_HP));
	draw_text(dx+120, dy+10+(1*voffset), "ATK: "+string(obj_bestiary_manager.bestiary[global.bestiI].attack));
	draw_text(dx+120, dy+10+(2*voffset), "DEF: "+string(obj_bestiary_manager.bestiary[global.bestiI].defence));
	draw_text(dx+10, dy+10+(4*voffset), obj_bestiary_manager.bestiary[global.bestiI].description);
	draw_text(dx+10, dy+10+(6*voffset), "Location: "+string(obj_bestiary_manager.bestiary[global.bestiI].location));
	draw_text(dx+10, dy+10+(7*voffset), "Item drop(s): "+string(obj_bestiary_manager.bestiary[global.bestiI].item_drops));
}
// Note that this box will not be drawn if "Back" is highlighted