

	// Draw clock on top right
draw_sprite_ext(spr_menu_back, 0, 310, 10, 100/78, 45/78, 0, c_white, 1);


draw_set_font(ft_gui);
draw_text(317, 10, month_name(global.worldDate.month) + " " 
			    + ordinal_suffix(global.worldDate.day));
				
draw_set_halign(fa_right);
draw_text(402, 22, string(global.worldDate.year));

draw_set_halign(fa_left);
draw_text(317, 30, weekday_name(global.worldDate.weekday));