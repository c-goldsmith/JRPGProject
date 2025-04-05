	// Draw the calendar when you hold the "c" key
if (!global.isDialogue) {
	if (keyboard_check(ord("C"))) {
		var square = 45
		var border = 2
		
		var left = 90
		var top = 85;
		var right = left + square*7;
		var bottom = top + square*6;
		
		var menuLeft	= left-2*border;
		var menuTop		= top-2*border-square/2;
		var menuWidth	= ((right+2*border)-(menuLeft))/78;
		var menuHeight	= ((bottom+2*border-square)-(menuTop))/78;
		
		draw_sprite_ext(spr_menu_back, 0, menuLeft, menuTop, menuWidth, menuHeight, 0, c_white, 1);
		
		var tempHAlign = draw_get_halign();
		var tempVAlign = draw_get_valign();
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		
		draw_set_color(c_black);
		draw_text(left + square*3.5, top-square/2, month_name(global.worldDate.month) + " " + string(menuWidth));
		
		var dateStart = false;
		var dateEnd = false;
		var dayOfMonth = 0;
		
		for (var i = 0; i < 5; i++) {
			for (var o = 0; o < 7; o++) {
				draw_set_color(c_black);
				draw_rectangle(left+square*o+border-1, top+square*i+border-1, left+square*(o+1)-border+1, top+square*(i+1)-border+1, false);
				
				draw_set_color(c_white);
				var monthBorderOffset = 0;
				
				if (dateStart && (dayOfMonth+1 == global.worldDate.day)) {
					monthBorderOffset = 1;
				}
				draw_rectangle(left+square*o+border+monthBorderOffset, top+square*i+border+monthBorderOffset, left+square*(o+1)-border-monthBorderOffset, top+square*(i+1)-border-monthBorderOffset, false);
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
				
				
				draw_text(left+square*(o+0.4)+border, top+square*(i-0.1)+border, day);
				
				var tempWeekday = o+1;
				if (tempWeekday == 7) { tempWeekday = 0; }
				
				if (dateStart) { dayOfMonth++; }
				
				if ((tempWeekday == get_weekday_of_date(dayOfMonth+1, global.worldDate.month, global.worldDate.year)) && (!dateStart)) { dateStart = true; dayOfMonth++; }
				if (dayOfMonth > get_month_length(global.worldDate.month, global.worldDate.year)) { dateEnd = true; }
				
				
				if (dateStart && !dateEnd) {
					var tempDate = ordinal_suffix(dayOfMonth);
					draw_text(left+square*(o+0.4)+border, top+square*(i+0.4)+border, tempDate);
					
					if (holiday_check(dayOfMonth, global.worldDate.month, "Exists")) {
						draw_set_color(c_yellow);
						draw_circle(left+square*(o+0.4)+border, top+square*(i+0.4)+border, 5, false);
						draw_set_color(c_black);
						draw_circle(left+square*(o+0.4)+border, top+square*(i+0.4)+border, 5, true);
					}
				}
				
				
				
			}
		}
		
		draw_set_halign(tempHAlign);
		draw_set_valign(tempVAlign);
		draw_set_color(c_black);
	}
}