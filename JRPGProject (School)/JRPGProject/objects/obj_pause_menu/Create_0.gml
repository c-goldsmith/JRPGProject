/// @description Checks when created

// Set up variables
draw_set_color(c_black); // Sets default text drawing color
draw_set_font(ft_basic); // Sets default drawing font

// Menu level 0
pauseMenuText[0, 0] = "Party";
pauseMenuText[0, 1] = "Inventory";
pauseMenuText[0, 2] = "Bestiary";
pauseMenuText[0, 3] = "Quit";

// Menu level 1 - Party
// (has placeholder text for now)
pauseMenuText[1, 0] = "Rosette";
pauseMenuText[1, 1] = "PartyMember2";
pauseMenuText[1, 2] = "PartyMember3";
pauseMenuText[1, 3] = "PartyMember4";
pauseMenuText[1, 4] = "Back";

// Menu level 2 - Inventory
// Can show the current items on hand
inv_length = array_length(obj_item_manager.inventory)

for (i = 0; i < inv_length; i += 1) {
	pauseMenuText[2, i] = obj_item_manager.inventory[i].name
}
pauseMenuText[2, i] = "Back";

// Menu level 3 - Bestiary table of contents
// (has placeholder text for now)
bes_length = array_length(obj_bestiary_manager.bestiary)

for (i = 0; i < bes_length; i += 1) {
	pauseMenuText[3, i] = obj_bestiary_manager.bestiary[i].name
}
pauseMenuText[3, i] = "Back";

// Level, position, length of the Pause Menu
pauseMenuLevel = 0;
pauseMenuPos = 0;
pauseMenuLength = 0;

// Testing variables for the unit tests
checki = 0;
global.pausetest_arg1 = 0; 
global.pausetest_arg2 = 0;
global.pausetest_arg3 = 0; 
global.pausetest_arg4 = 0;

global.pausetest_arg7 = 0; 
global.pausetest_arg8 = 0;

// The whitebox tests
pause_whiteBox_Tests();
