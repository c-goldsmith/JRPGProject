/// @description Draw to screen above others
//Copied from the object main menu 

// Temp font storage
if(global.currentPartyMem == 1) draw_set_color(c_maroon);
else if(global.battlersActive[1] == 0) draw_set_color(c_gray);
else draw_set_color(c_black);
var oldFont = draw_get_font();
draw_set_font(ft_basic);

draw_text(textXmod + x, (y - 2) + textYmod, global.battlersNames[1]);
// Reset color back to black

draw_set_color(c_black);

playerHP = (global.battlersCurrentHP[1] / global.battlersMaxHP[1]) * 100;
draw_healthbar(x, y + 21, x + 93, y + 25, playerHP, c_black, c_red, c_lime, 0, true, true);
playerMP = (global.partyCurrentMP[1] / global.partyMaxMP[1]) * 100;
if(global.battlersActive[1] != 0) draw_healthbar(x, y + 27, x + 93, y + 31, playerMP, c_black, c_navy, c_blue, 0, true, true);

// Reset the font. ALWAYS HAVE AS LAST LINE
draw_set_font(oldFont);