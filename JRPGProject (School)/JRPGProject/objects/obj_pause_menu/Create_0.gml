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
// (has placeholder text for now)
pauseMenuText[2, 0] = "Item1";
pauseMenuText[2, 1] = "Item2";
pauseMenuText[2, 2] = "Item3";
pauseMenuText[2, 3] = "Back";

// Menu level 3 - Bestiary table of contents
// (has placeholder text for now)
pauseMenuText[3, 0] = "Enemy1";
pauseMenuText[3, 1] = "Enemy2";
pauseMenuText[3, 2] = "Enemy3";
pauseMenuText[3, 3] = "Enemy4";
pauseMenuText[3, 4] = "Back";

// Level, position, length of the Pause Menu
pauseMenuLevel = 0;
pauseMenuPos = 0;
pauseMenuLength = 0;
