/// @description Checks when created


playerHP = 100;
playerMP = 100;
baseY = y;
newY = y + 20;

draw_set_font(ft_basic);

playerName = global.battlersNames[0];

textWidth = string_width(playerName);
textHeight = string_height(playerName);

textXmod = (sprite_width - textWidth) / 2;
textYmod = (sprite_height - textHeight) / 2;