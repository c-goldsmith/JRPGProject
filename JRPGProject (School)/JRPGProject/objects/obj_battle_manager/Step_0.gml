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
		global.activeParty = currentBattler;
		battleTarget = 3;
		if(global.battlersActive[3] == 0) battleTarget = 4;
		if(global.battlersActive[4] == 0) battleTarget = 5;
	} else {
		battleTarget = 0;
		if(global.battlersActive[0] == 0) battleTarget = 1;
	}
	
	battlerName = global.battlersNames[currentBattler];
	defenderName = global.battlersNames[battleTarget];
	
	//if one of the enemies attacking - makes choice for them
	if(currentBattler >= 3)
	{
		global.moveID = choose(5, 5, 1, 5, 5);
	}

	//if haven't already done move...
	if(didMove == 0)
	{
		battlersDefending[currentBattler] = 0;
	
		if(global.moveID != 0)
		{
			if(global.moveID == 1)
			{
				//marks user as defending til their next turn
				global.currentMessage = battlerName + " defended!";
				battlersDefending[currentBattler] = 1;
				if(currentBattler < 3)
				{
					global.partyCurrentMP[currentBattler] = global.partyCurrentMP[currentBattler] + 5;
					if(global.partyCurrentMP[currentBattler] <= 0) global.partyCurrentMP[currentBattler] = global.partyMaxMP[currentBattler];
				}
			} else if(global.moveID == 2)
			{
				//message for scanning enemy
				global.currentMessage = "You scanned the rat: It's a placeholder!";
			} else if(global.moveID == 3)
			{
				//heals half of player's HP
				if(global.partyCurrentMP[currentBattler] < 10)
				{
					global.currentMessage = "Don't have enough MP!";
					currentBattler--;
					if(currentBattler == -1) currentBattler = 6;
				} else {
					global.partyCurrentMP[currentBattler] = global.partyCurrentMP[currentBattler] - 10;
					if(global.partyCurrentMP[currentBattler] <= 0) global.partyCurrentMP[currentBattler] = 0;
					
					global.currentMessage = battlerName + " healed!";
					global.battlersCurrentHP[currentBattler] = global.battlersCurrentHP[currentBattler] + (global.battlersMaxHP[currentBattler]/2);
					//makes sure to not heal above HP cap
					if(global.battlersCurrentHP[currentBattler] >= global.battlersMaxHP[currentBattler]) 
					{
						global.battlersCurrentHP[currentBattler] = global.battlersMaxHP[currentBattler];
					}
				}
			} else if(global.moveID == 4) {
				global.currentMessage = "Group Heal has not been implemented yet.";
				currentBattler--;
				if(currentBattler == -1) currentBattler = 6;
			} else if(global.moveID >= 5)
			{
				show_debug_message("am i even getting here???");
				checkMP = MPcheck(currentBattler);
				
				show_debug_message("checkMP is {0}", checkMP);
				//does magic attack, checks if has enough MP
				if(!checkMP)
				{
					//currently just skips your turn if you don't have enough, i will fix this
					global.currentMessage = "Don't have enough MP!";
					currentBattler--;
					if(currentBattler == -1) currentBattler = 6;
				} else {
					//same sort of damage calculations as for basic attack - will generalize this later
					
					userAttack = battlersAttack[currentBattler];
					targetDefense = battlersDefense[battleTarget];
					targetDefending = battlersDefending[battleTarget];
					
					doDamage(currentBattler, battleTarget, userAttack, targetDefense, targetDefending);
					
					if(global.moveID == 5)
					{
						global.currentMessage = battlerName + " attacked " + defenderName + "!";
					} else {
						global.currentMessage = battlerName + " used " + global.attackName + " on " + defenderName + "!";
					}
					
					if(global.battlersCurrentHP[battleTarget] <= 0) 
					{
						alarm[0] = 0.55 * game_get_speed(gamespeed_fps);
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
			if(currentBattler >= 6) currentBattler = 0;
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
