/// @description Insert description here
// You can write your code in this editor

//checks if it's player or enemy turn
if((currentTurn % 2) != 0)
{
	//if move not selected yet - display this text
	if(didMove == 0)
	{
		currentMessage = "Please select an option.";
	} 
	
	//if move has been selected, continue
	if((global.moveID != 0) && (didMove == 0))
	{
		if(global.moveID == 1)
		{
			//if basic attack done, do 10 damage to enemy
			currentMessage = "You attacked!";
			enemyHP = enemyHP - 10;
			//if enemy defeated, add extra text
			if(enemyHP <= 0)
			{
				currentMessage = currentMessage + " Enemy fainted!";
			}
		} else if(global.moveID == 2)
		{
			//message for if defending (no functionality yet)
			currentMessage = "You defended!";
		} else if(global.moveID == 3)
		{
			//message for if scanning enemy
			currentMessage = "You scanned the rat: It's a placeholder!";
		} else if(global.moveID == 4)
		{
			//heals 10 hp from player
			currentMessage = "You healed!";
			playerHP = playerHP + 10;
			if(playerHP > 100) playerHP = 100;
		}
		//resets moveID for next turn
		global.moveID = 0;
		//records move has been done and selected
		didMove = 1;
		//alarm so text stays on screen for a short period before
		//moving to next turn - will be changed to progress with space in future
		alarm[0] = game_get_speed(gamespeed_fps);
	}
	
} else {
	if(didMove == 0)
	{
		//if enemy turn, just attack player
		currentMessage = "The rat attacked!";
		playerHP = playerHP - 5;
		didMove = 1;
		//add to message if player defeated
		if(playerHP <= 0)
		{
			currentMessage = currentMessage + " Player fainted!";
		}
		//alarm (same as above)
		alarm[0] = game_get_speed(gamespeed_fps);
	}
}