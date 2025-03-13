
//Tests to Run for Battle System

//The following are White Box Tests - with the intention of covering every way to make sure
//the battle should be continuing. It tests every case where a battle should end, and also makes sure
//the variables responsible for actually ending the battle aren't doing so prematurely.

//(will note each "gmltest_expect" is equivalent to an assert, these are all in separate tests just cause
//it's better labeling wise)
test("Battle Has Not Ended: Active Allies", function(){
	//checks that at least one party member is active, since if none are, battle should end
	totalPartyActive = global.battlersActive[0] + global.battlersActive[1] + global.battlersActive[2];
	gmltest_expect_gt(0, totalPartyActive);
});

test("Battle Has Not Ended: Party Has HP", function(){
	//checks that at least one party member has HP - this is similar to above, 
	//but would catch if there was an error in the main code's implementation to set them to inactive
	//(also checks to make sure HP does not go to negatives)
	totalPartyHP = global.battlersCurrentHP[0] + global.battlersCurrentHP[1] + global.battlersCurrentHP[2];
	gmltest_expect_gt(0, totalPartyHP);
});

test("Battle Has Not Ended: Active Enemies", function(){
	//checks that at least one enemy is active, since if none are, battle should end
	totalEnemyActive = global.battlersActive[3] + global.battlersActive[4] + global.battlersActive[5];
	gmltest_expect_gt(0, totalEnemyActive);
});

test("Battle Has Not Ended: Enemies Have HP", function(){
	//checks that at least one enemy has HP - this is similar to above, 
	//but would catch if there was an error in the main code's implementation to set them to inactive
	//(also checks to make sure HP does not go to negatives)
	totalEnemyHP = global.battlersCurrentHP[3] + global.battlersCurrentHP[4] + global.battlersCurrentHP[5];
	gmltest_expect_gt(0, totalEnemyHP);
});

test("Battle Has Not Ended: BattleEnd False", function(){
	//checks to make sure that the regular battle code is not just continuing to
	//run even if the battle should have ended
	gmltest_expect_false(global.battleEnd);
});


// Black Box Testing for Turns
test("Current Turn is Valid", function(){
	//Makes sure it doesn't go out of expected turn range
	gmltest_expect_gt(-1, currentTurn);
	gmltest_expect_lt(6, currentTurn);
});

test("Current Battler Exists", function(){
	//makes sure battler actually exists
	gmltest_expect_true(global.battlersActive[currentTurn]);
});

//Integration Testing for Enemy Instance
function testEnemy1() : GMLTest_Harness() constructor {
	
	enemyInstance = noone;
	
	function setup(){
		// Create temporary instance of object for testing to access the variables
		enemyInstance = instance_create_depth(165, 17, 0, obj_enemy_plate_1);
		enemyInstance.visible = 0;
	}
	
	function tear_down(){
		// cleans up extra object after testing (this is just how to format these types of tests
		// within this framework)
		instance_destroy(enemyInstance);
	}
	
}

//Enemy 1 is an object dependant on the Battle Manager. It should always spawn, so it checks that it does.
test_f(testEnemy1, "Enemy 1 Spawns Correctly", function(){
	gmltest_expect_true(global.battlersActive[3]);
	gmltest_expect_eq(global.battlersNames[3], enemyInstance.enemyName);
});

//This tests to make sure the label text for Enemy 1 is within the given borders
test_f(testEnemy1, "Enemy 1 Text Within Border Boundaries", function(){
	gmltest_expect_gt(enemyInstance.x, enemyInstance.textX);
	gmltest_expect_gt(enemyInstance.y, enemyInstance.textY);
	gmltest_expect_lt(enemyInstance.y + enemyInstance.sprite_height, enemyInstance.textY + enemyInstance.textHeight);
	gmltest_expect_lt(enemyInstance.x + enemyInstance.sprite_width, enemyInstance.textX + enemyInstance.textWidth);
});




