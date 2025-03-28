/// @description Draw to screen above others
//Copied from the object main menu 

// Temp font storage
draw_set_color(c_black);
var oldFont = draw_get_font();
draw_set_font(ft_basic);

draw_text(textX, textY, enemyName);
// Reset color back to black

draw_set_color(c_black);

enemyHP = (global.battlersCurrentHP[4] / global.battlersMaxHP[4]) * 100;
draw_healthbar(x + 10, y + 25, x + 75, y + 30, enemyHP, c_black, c_red, c_lime, 0, true, true)

draw_sprite(spr_battleRat_test, 0, x + 45, y + 85);
// Reset the font. ALWAYS HAVE AS LAST LINE
draw_set_font(oldFont);