// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function battle_chooser(friendlyFire){
		global.currentMessage = "Pick a target!";
		global.messageToShow = 1;
		global.needToChoose = 1;
		if(friendlyFire == 1)
		{
			global.enemyOrAlly = 0;
		} else {
			global.enemyOrAlly = 1;
		}
}