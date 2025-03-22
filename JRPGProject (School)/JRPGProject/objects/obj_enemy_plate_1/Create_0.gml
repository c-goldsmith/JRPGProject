/// @description Checks when created

spriteShown = 1;
enemyHP = 100;
enemyName = global.battlersNames[3]

draw_set_font(ft_basic);

textWidth = string_width(enemyName);
textHeight = string_height(enemyName);

textX = x + ((sprite_width - textWidth) / 2);
textY = y + ((sprite_height - textHeight) / 2);