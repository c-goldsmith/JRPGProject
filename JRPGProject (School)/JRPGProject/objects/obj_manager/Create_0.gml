/// @description Create globals
// THIS OBJECT IS FOR MANAGING ALL SORTS OF STUFF WITH AN OBJECT YOU WANT
// TO ALWAYS EXIST

// It is created when the game starts and should NEVER be killed or created again,
// otherwise BAD THINGS will happen.

// Basic Setup


// Global variables
global.areaExit = 0; // Used for determining which place exit inside an "area" was used,
					 // to determine where on the big map to put the player
global.worldDate = { // Global date, used to measure time. This is the default time, August 10th, 1444.
	day		: 10,
	month	: 8,
	year	: 1444,
	weekday : 6
};

global.isPaused		= false;
global.isDialogue	= false;

global.flags		= array_create(100, 0); // Array of variables for "Flags", for determining if certain events should be fired or not
global.holidays		= array_create(100, 0); // Array of variables for holidays and if they've happened yet on that frame. Is reset on a new year