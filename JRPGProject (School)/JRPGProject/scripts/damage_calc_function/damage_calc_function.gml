// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function doDamage(user, target, userAttack, oppDefense, isDefending){
	moveData = getMoveData();
	basePower = moveData[0];
	MPcost = moveData[1];
	damageToAll = moveData[2];
	
	if(user < 3)
	{
		global.partyCurrentMP[user] = global.partyCurrentMP[user] - MPcost;
		if(global.partyCurrentMP[user] <= 0) global.partyCurrentMP[MPcost] = 0;
	}
	
	if(damageToAll == 1)
	{
		for(var i = 3; i < 6; i++)
		{
			if(global.battlersActive[i] == 1)
			{
				global.battlersCurrentHP[i] = global.battlersCurrentHP[i] - 10;
				if(global.battlersCurrentHP[i] <= 0) global.battlersCurrentHP[i] = 0;
			}
		}
		return;
	}
	
	damageDealt = floor(basePower * (userAttack/oppDefense));
	if(isDefending == 1) damageDealt = floor(damageDealt / 2);
	
	global.battlersCurrentHP[target] = global.battlersCurrentHP[target] - damageDealt;
	if(global.battlersCurrentHP[target] <= 0) global.battlersCurrentHP[target] = 0;
	
	if(global.battlersCurrentHP[target] == 0) global.battlersActive[target] = 0;
}

function getMoveData()
{
	if(global.moveID == 5)
	{
		return [10, 0, 0]; //basic attack
	} else if (global.moveID == 6)
	{
		global.attackName = "Fireball";
		return [30, 25, 0]; //fireball
	} else if (global.moveID == 7)
	{
		global.attackName = "Thunderbolt";
		return [20, 15, 0]; //Thunderbolt
	} else if (global.moveID == 8)
	{
		global.attackName = "Cold Wind";
		return [0, 25, 1];
	} else {
		errorMess = "Invalid move ID of: " + global.moveID
		show_error(errorMess, false);
		return [0, 0, 0];
	}
}

function MPcheck(user)
{
	moveData = getMoveData();
	MPcost = moveData[1];
	
	if(user > 2) return true;
	
	if(global.partyCurrentMP[user] < MPcost)
	{
		show_debug_message("Current MP is: {0}", global.partyCurrentMP[user]);
		show_debug_message("Needed MP is: {0}", MPcost);
		return false;
	} else {
		return true;
	}
}

