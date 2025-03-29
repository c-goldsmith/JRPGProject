

	// Draw clock on top right
draw_sprite_ext(spr_menu_back, 0, 310, 10, 100/78, 45/78, 0, c_white, 1);


draw_set_font(ft_gui);
draw_text(317, 10, month_name(global.worldDate.month) + " " 
			    + ordinal_suffix(global.worldDate.day));
				
draw_set_halign(fa_right);
draw_text(402, 22, string(global.worldDate.year));

draw_set_halign(fa_left);
draw_text(317, 30, weekday_name(global.worldDate.weekday));


	// Draw location name and inspection sprite overlay when walking over a map spot
var mapSpot = instance_place(x,y,par_mapspot);

if (!(mapSpot == noone) && !(global.isPaused) && !(global.isDialogue)) {
	draw_sprite_ext(spr_menu_back, 0, (210-((string_width(mapSpot.spotName)+20)/2)), 80, 
				   (string_width(mapSpot.spotName)+20)/78, 30/78, 0, c_white, 1);
	draw_set_halign(fa_center);
	draw_text(210, 84, mapSpot.spotName);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_bigmap_inspect_Button, 0, 210, 115, 1, 1, 0, c_white, 1);
}

