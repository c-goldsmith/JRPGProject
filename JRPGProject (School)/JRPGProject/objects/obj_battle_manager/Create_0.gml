/// @description Insert description here
// You can write your code in this editor

//Most of this code will be further edited later. Right now things are just 
//hard-coded.

//set player and enemy hp at start of battle
enemyHP = 100;
playerHP = 100;
//turn counter (for determining who moves)
currentTurn = 1;
//global moveID is a variable that lets the battle menu
//communicate with the manager
global.moveID = 0;
//default message to display
global.currentMessage = "Please select an option.";
//variable for if move has been selected
didMove = 0;
global.halted = 0;
battleEnd = false;

//hardcoded right now - will be generalized later
global.battlersNames =
["Party 1", "Party 2", "Party 3", "Rat 1", "Rat 2", "Rat 3"];
global.battlersCurrentHP = [100, 0, 0, 100, 0, 0];
global.battlersMaxHP = [100, 100, 100, 100, 100, 100, 100];
global.battlersActive = [1, 0, 0, 1, 0, 0];
currentBattler = 0;
battleTarget = 2;
battlerName = "placeholder";
defenderName = "placeholder2";



