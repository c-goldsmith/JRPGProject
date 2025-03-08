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
	
	if(currentBattler < 3)
	{
		battleTarget = 3;
		if(global.battlersActive[3] == 0) battleTarget = 4;
		if(global.battlersActive[4] == 0) battleTarget = 5;
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
		battlersDefending[currentBattler] = 0;
	
		if(global.moveID != 0)
		{
			//checks what move was done (will change to switch)
			if(global.moveID == 1)
			{
				//if basic attack, does damage calc
				damageDealt = floor(10 * (battlersAttack[currentBattler]/battlersDefense[battleTarget]));
				//checks if attacking defending player - halves damage
				if(battlersDefending[battleTarget] == 1) damageDealt = floor(damageDealt / 2);
				
				//does the damage
				global.battlersCurrentHP[battleTarget] = global.battlersCurrentHP[battleTarget] - damageDealt;
				if(global.battlersCurrentHP[battleTarget] <= 0) global.battlersCurrentHP[battleTarget] = 0;
			
				//displays message
				global.currentMessage = battlerName + " attacked " + defenderName + "!";
				
				//if defeated, show message
				if(global.battlersCurrentHP[battleTarget] <= 0) 
				{
					global.currentMessage = defenderName + " was defeated!";
					global.battlersActive[battleTarget] = 0;
				}
			}
			else if(global.moveID == 2)
			{
				//marks user as defending til their next turn
				global.currentMessage = battlerName + " defended!";
				battlersDefending[currentBattler] = 1;
			} else if(global.moveID == 3)
			{
				//message for scanning enemy
				global.currentMessage = "You scanned the rat: It's a placeholder!";
			} else if(global.moveID == 4)
			{
				//heals half of player's HP
				global.currentMessage = battlerName + " healed!";
				global.battlersCurrentHP[currentBattler] = global.battlersCurrentHP[currentBattler] + (global.battlersMaxHP[currentBattler]/2);
				//makes sure to not heal above HP cap
				if(global.battlersCurrentHP[currentBattler] >= global.battlersMaxHP[currentBattler]) 
				{
					global.battlersCurrentHP[global.currentBattler] = global.battlersMaxHP[global.currentBattler];
				}
			} else if(global.moveID == 5)
			{
				//does magic attack, checks if has enough MP
				if(global.partyCurrentMP[currentBattler] < 20)
				{
					//currently just skips your turn if you don't have enough, i will fix this
					global.currentMessage = "Don't have enough MP!";
				} else {
					//same sort of damage calculations as for basic attack - will generalize this later
					global.partyCurrentMP[currentBattler] = global.partyCurrentMP[currentBattler] - 20;
					if(global.partyCurrentMP[currentBattler] <= 0) global.partyCurrentMP[currentBattler] = 0;
					
					damageDealt = floor(25 * (battlersAttack[currentBattler]/battlersDefense[battleTarget]));
					if(battlersDefending[battleTarget] == 1) damageDealt = floor(damageDealt / 2);
				
					global.battlersCurrentHP[battleTarget] = global.battlersCurrentHP[battleTarget] - damageDealt;
					if(global.battlersCurrentHP[battleTarget] <= 0) global.battlersCurrentHP[battleTarget] = 0;
					
					global.currentMessage = battlerName + " used Fireball on " + defenderName + "!";
					
					if(global.battlersCurrentHP[battleTarget] <= 0) 
					{
						global.currentMessage = defenderName + " was defeated!";
						global.battlersActive[battleTarget] = 0;
					}
				}
			
			}
			
			//checks if battle ended (all enemies or all allies are inactive)
			if((global.battlersCurrentHP[0] + global.battlersCurrentHP[1] + global.battlersCurrentHP[2] <= 0) 
				|| (global.battlersCurrentHP[3]  + global.battlersCurrentHP[4] + global.battlersCurrentHP[5] <= 0)) 
			{
					battleEnd = true;
			}
			
			//end of turn stuff
			//marks move was done
			didMove = 1;
			global.selectedEnemy = 0;
			//tells dialogue what to show stuff
			global.messagesLeft = 1;
			global.messageToShow = 1;
			//goes to next battler
			currentBattler++;
			if(currentBattler == 6) currentBattler = 0;
			while(global.battlersActive[currentBattler] == 0)
			{
				currentBattler++;
				if(currentBattler == 6) currentBattler = 0;
			}
			
			//resets stuff
			didMove = 0;
			global.moveID = 0;
			damageDealt = 0;
			//halts game to wait for dialogue progression
			global.halted = 1;
		}
	}
} else {
	//resets this again - unsure why but this is needed
	global.moveID = 0;
}
