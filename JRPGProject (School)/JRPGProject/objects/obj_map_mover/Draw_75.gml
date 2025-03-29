	// Draw the calendar when you hold the "c" key
if (!global.isDialogue) {
	if (keyboard_check(ord("C"))) {
		var square = 45
		var border = 2
		
		var left = 50
		var top = 70;
		var right = left + square*7;
		var bottom = top + square*4;
		
		draw_set_color(c_purple);
		draw_rectangle(left-2*border, top-2*border, right+2*border, bottom+2*border, false);
		
		for (var i = 0; i < 4; i++) {
			for (var o = 0; o < 7; o++) {
				draw_set_color(c_white);
				draw_rectangle(left+square*o+border, top+square*i+border, left+square*(o+1)-border, top+square*(i+1)-border, false);
				var day = "wef";
				switch (o) {
					case 0:
						day = "Sun";
					break;
					case 1:
						day = "Mon";
					break;
					case 2:
						day = "Tue";
					break;
					case 3:
						day = "Wed";
					break;
					case 4:
						day = "Thu";
					break;
					case 5:
						day = "Fri";
					break;
					case 6:
						day = "Sat";
					break;
				}
				
				draw_set_color(c_black);
				
				var tempHAlign = draw_get_halign();
				var tempVAlign = draw_get_valign();
				draw_set_halign(fa_center);
				draw_set_valign(fa_top);
				draw_text(left+square*(o+0.4)+border, top+square*(i-0.1)+border, day);
				draw_set_halign(tempHAlign);
				draw_set_valign(tempVAlign);
			}
		}
		
		draw_set_color(c_black);
	}
}