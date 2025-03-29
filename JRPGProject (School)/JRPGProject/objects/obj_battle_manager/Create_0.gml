/// @description Insert description here
// You can write your code in this editor

//Most of this code will be further edited later. Right now things are just 
//hard-coded.

//randomise seed
randomise();
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
["Rosette", "Party 2", "Party 3", "Rat 1", "Rat 2", "Rat 3"];

global.battlersCurrentHP = [100, 100, 0, 75, 75, 75];
global.battlersMaxHP = [100, 100, 100, 75, 75, 75, 75];
global.partyCurrentMP = [50, 75, 0];
global.partyMaxMP = [50, 75, 0];
global.battlersActive = [1, 1, 0, 1, 1, 1];
battlersAttack = [50, 50, 50, 25, 25, 25];
battlersDefense = [75, 75, 75, 25, 25, 25];
battlersDefending = [0, 0, 0, 0, 0, 0];
currentBattler = 0;
battleTarget = 2;

global.attackName = "placeholder";
battlerName = "placeholder";
defenderName = "placeholder";

global.activeParty = 0;

damageDealt = 0;
failedMove = 0;

global.selectedEnemy = 0;

//temp variables for battle formula
targetDefending = 0;
targetDefense = 0;
userAttack = 0;
checkMP = false;


