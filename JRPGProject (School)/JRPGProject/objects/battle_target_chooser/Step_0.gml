/// @description Insert description here
// You can write your code in this editor

if(global.needToChoose == 1)
{
	if(visible == 0)
	{
		chosenTarget = 0;
		
		if(global.enemyOrAlly == 0)
		{
			y = partyYpos;
			
			if(global.battlersActive[0] == 0) chosenTarget = 1;
			if(global.battlersActive[1] == 0) chosenTarget = 2;
		} else {
			y = enemyYpos;
			
			if(global.battlersActive[3] == 0) chosenTarget = 2;
			if(global.battlersActive[4] == 0) chosenTarget = 1;
		}
		
		x = xValues[chosenTarget];
	}
	visible = 1;
} else {
	visible = 0;
}

