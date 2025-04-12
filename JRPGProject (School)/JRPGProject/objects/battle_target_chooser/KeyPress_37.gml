/// @description Insert description here
// You can write your code in this editor

if(visible == 0) exit;

chosenTarget = chosenTarget - 1;
if(chosenTarget < 0) chosenTarget = 2;

if(global.enemyOrAlly == 0)
{
	while(global.battlersActive[chosenTarget] == 0)
	{
		chosenTarget = chosenTarget - 1;
		if(chosenTarget < 0) chosenTarget = 2;
	}
} else {
	invalidTarget = 1;
	while(invalidTarget)
	{
		if ((chosenTarget == 0) && (global.battlersActive[4] == 0))
		{
			chosenTarget = 2;
		} else if ((chosenTarget == 1) && (global.battlersActive[3] == 0)) 
		{
			chosenTarget = 0;
		} else if ((chosenTarget == 2) && (global.battlersActive[5] == 0))
		{
			chosenTarget = 1;
		} else {
			invalidTarget = 0;
		}
	}
}

x = xValues[chosenTarget];