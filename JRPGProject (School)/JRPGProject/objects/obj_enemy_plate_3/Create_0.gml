/// @description Checks when created

if(global.battlersActive[5] != 1)
{
	instance_destroy();
}

enemyHP = 100;
enemyName = global.battlersNames[5]

draw_set_font(ft_basic);

textWidth = string_width(enemyName);
textHeight = string_height(enemyName);

textX = x + ((sprite_width - textWidth) / 2);
textY = y + ((sprite_height - textHeight) / 2);