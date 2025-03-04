/// @description Insert description here
// You can write your code in this editor

//checks if it's player or enemy turn
if(global.halted == 0)
{
	if(battleEnd)
	{
		room_goto(rm_start_test);
	}
	//checks who the battler is
	
	if(global.currentBattler == 0)
	{
		battleTarget = 3;
	} else {
		battleTarget = 0;
	}
	
	battlerName = global.battlersNames[global.currentBattler];
	defenderName = global.battlersNames[battleTarget];
	
	//if one of the enemies attacking - makes choice for them
	if(global.currentBattler >= 2)
	{
		global.moveID = 1;
	}

	//if haven't already done move...
	if(didMove == 0)
	{
		//this will be removed
		if(global.currentBattler == 0)
		{
			global.currentMessage = "Please select option.";
		}
	
		if(global.moveID != 0)
		{
			//checks what move was done (will change to switch)
			if(global.moveID == 1)
			{
				global.battlersCurrentHP[battleTarget] = global.battlersCurrentHP[battleTarget] - 15;
				if(global.battlersCurrentHP[battleTarget] <= 0) global.battlersCurrentHP[battleTarget] = 0;
			
				global.currentMessage = battlerName + " attacked " 
					+ defenderName + "!";
				if((global.battlersCurrentHP[0] + global.battlersCurrentHP[1] + global.battlersCurrentHP[2] <= 0) 
					|| (global.battlersCurrentHP[3]  + global.battlersCurrentHP[4] + global.battlersCurrentHP[5] <= 0)) 
				{
					global.currentMessage = global.currentMessage + " " + defenderName 
						+ " fainted!";
						battleEnd = true;
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
				global.battlersCurrentHP[global.currentBattler] = global.battlersCurrentHP[global.currentBattler] + 25;
				if(global.battlersCurrentHP[global.currentBattler] >= global.battlersMaxHP[global.currentBattler]) 
				{
					global.battlersCurrentHP[global.currentBattler] = global.battlersMaxHP[global.currentBattler];
				}
			}
			
			//end of turn stuff
			//marks move was done
			didMove = 1;
			//tells dialogue what to show stuff
			global.messagesLeft = 1;
			global.messageToShow = 1;
			//goes to next battler
			global.currentBattler++;
			while(global.battlersActive[global.currentBattler] == 0)
			{
				global.currentBattler++;
				if(global.currentBattler >= 6) global.currentBattler = 0;
			}
			//resets stuff
			didMove = 0;
			global.moveID = 0;
			//halts game to wait for dialogue progression
			global.halted = 1;

			//if either defeated, go back to start screen
		}
	}
} else {
	//resets this again - unsure why but this is needed
	global.moveID = 0;
}
