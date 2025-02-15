/// @description Insert description here
// You can write your code in this editor

//draw text just to see if things work right - will be made pretty later
draw_set_color(c_yellow);
draw_text(20, 20, "Player HP: " + string(playerHP) + "/100");
draw_text(20, 40, "Enemy HP: " + string(enemyHP) + "/100");
/*
Bug Testing Messages:
draw_text(20, 60, "Global MessLeft: " + string(global.messagesLeft));
draw_text(20, 80, "Current MessShow: " + string(global.messageToShow));
*/

//commented out cause no longer needed - but nice for bugtesting
//draw_text(20, 170, global.currentMessage);