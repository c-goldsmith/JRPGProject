/// @description Insert description here
// You can write your code in this editor

if((currentTurn % 2) != 0)
{
	if(didMove == 0)
	{
		currentMessage = "Please select an option.";
	} 
	
	if((global.moveID != 0) && (didMove == 0))
	{
		if(global.moveID == 1)
		{
			currentMessage = "You attacked!";
			enemyHP = enemyHP - 10;
		} else if(global.moveID == 2)
		{
			currentMessage = "You defended!";
		} else if(global.moveID == 3)
		{
			currentMessage = "You scanned the rat: It's a rat!";
		} else if(global.moveID == 4)
		{
			currentMessage = "You healed!";
			playerHP = playerHP + 10;
		}
		global.moveID = 0;
		didMove = 1;
		alarm[0] = game_get_speed(gamespeed_fps);
	}
	
} else {
	if(didMove == 0)
	{
		currentMessage = "The rat attacked!";
		playerHP = playerHP - 5;
		didMove = 1;
		alarm[0] = game_get_speed(gamespeed_fps);
	}
}