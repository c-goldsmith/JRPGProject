/// @description Insert description here
// You can write your code in this editor


if(global.needToChoose == 1)
{
	if(global.enemyOrAlly == 0)
	{
		global.chosenBattler = chosenTarget;
	} else {
		if(chosenTarget == 0) global.chosenBattler = 4;
		if(chosenTarget == 1) global.chosenBattler = 3;
		if(chosenTarget == 2) global.chosenBattler = 5;
	}
	
	global.needToChoose = 2;
	
}