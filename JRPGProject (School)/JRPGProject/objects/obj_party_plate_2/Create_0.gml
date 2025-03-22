/// @description Checks when created
if(global.battlersActive[1] != 1)
{
	instance_destroy();
}

playerHP = 100;
playerMP = 100;
baseY = y;
newY = y + 20;

draw_set_font(ft_basic);

playerName = global.battlersNames[1];

textWidth = string_width(playerName);
textHeight = string_height(playerName);

textXmod = (sprite_width - textWidth) / 2;
textYmod = (sprite_height - textHeight) / 2;