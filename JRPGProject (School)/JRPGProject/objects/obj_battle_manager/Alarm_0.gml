/// @description Insert description here
// You can write your code in this editor

currentTurn++;
didMove = 0;
//if either defeated, go back to start screen
if((enemyHP <= 0) || (playerHP <= 0))
{
	room_goto(rm_start_test);
}