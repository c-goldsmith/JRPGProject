/// @description Insert description here
// You can write your code in this editor

//checks if it's player or enemy turn
if(global.halted == 0)
{
	//checks who the battler is
	if(currentBattler == 1)
	{
		battlerName = party1;
		defenderName = enemy1;
	} else {
		battlerName = enemy1;
		defenderName = party1;
	}

	//if one of the enemies attacking - makes choice for them
	if(currentBattler > 3)
	{
		global.moveID = 1;
	}

	//if haven't already done move...
	if(didMove == 0)
	{
		//this will be removed
		if(currentBattler == 1)
		{
			global.currentMessage = "Please select option.";
		}
	
		if(global.moveID != 0)
		{
			//checks what move was done (will change to switch)
			if(global.moveID == 1)
			{
				if(currentBattler == 1) 
				{ 
					enemyHP = enemyHP - 10; 
				} else {
					playerHP = playerHP - 5;
				}
				global.currentMessage = battlerName + " attacked " 
					+ defenderName + "!";
				if(playerHP <= 0 || enemyHP <= 0) 
				{
					global.currentMessage = currentMessage + " " + defenderName 
						+ " fainted!";
				}
			}
			else if(global.moveID == 2)
			{
				global.currentMessage = battlerName + " defended!";
			} else if(global.moveID == 3)
			{
				//message for if scanning enemy
				global.currentMessage = "You scanned the rat: It's a placeholder!";
			} else if(global.moveID == 4)
			{
				//heals 10 hp from player
				global.currentMessage = battlerName + " healed!";
				playerHP = playerHP + 10;
				if(playerHP > 100) playerHP = 100;
			}
			
			//end of turn stuff
			//marks move was done
			didMove = 1;
			//tells dialogue what to show stuff
			global.messagesLeft = 1;
			global.messageToShow = 1;
			//goes to next battler
			currentBattler = currentBattler + 1;
			while(battlersActive[currentBattler - 1] == 0)
			{
				currentBattler++;
				if(currentBattler >= 7) currentBattler = 1;
			}
			//resets stuff
			didMove = 0;
			global.moveID = 0;
			//halts game to wait for dialogue progression
			global.halted = 1;

			//if either defeated, go back to start screen
			if((enemyHP <= 0) || (playerHP <= 0))
			{
				room_goto(rm_start_test);
			}
		}
	}
} else {
	//resets this again - unsure why but this is needed
	global.moveID = 0;
}
