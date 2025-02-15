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

//hardcoded right now - will be generalized later
party1 = "P1";
party2 = "P2";
party3 = "P3";
enemy1 = "Rat 1";
enemy2 = "Rat 2";
enemy3 = "Rat 3";

battlersActive = [1, 0, 0, 1, 0, 0];
currentBattler = 1;
battleTarget = 3;
battlerName = "placeholder";
defenderName = "placeholder2";



