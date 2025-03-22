// Tests specific for the Pause menu and its submenus

// White box Tests
function pause_whiteBox_Tests() {	
	// #1 Whitebox test - This is for testing array bounds in Draw GUI,
	// expects them to be equal/true, covers 2 branches for true and false
	test("Check array bounds Pause Menu's Draw GUI", function() {
		gmltest_expect_true(isEqualsNum(global.pausetest_arg1,global.pausetest_arg2))
	});


	// #2 Whitebox Test - For testing if the pause menu position number is still within bounds of
	// the length of the array. Mutants may go out of bounds of the array so I
	// want to be sure that the menu position is within bounds if anything changes
	// in the code later. Covers 4 branches.
	test("Check if Pause Menu Pos is >= 0", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg3,0))
	});
	
	test("Check if Pause Menu Pos is <= pauseMenuLength-1", function() {
		gmltest_expect_true(isLTorEqualsNum(global.pausetest_arg3,global.pausetest_arg4))
	});
	
	// #3 Whitebox Tests - For testing the bound of the pause menu level. Mutants may go out of bounds.
	// Covers 4 branches here. This checks the switch statements hardcoding the
	// pause menu level to make sure it's not negative or beyond the bound of the array.
	test("Check if Pause Menu Level is >= 0", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg3,0))
	});
	
	test("Check if Pause Menu Level is <= 3", function() {
		gmltest_expect_true(isLTorEqualsNum(global.pausetest_arg3,global.pausetest_arg4))
	});
	
	// #4 Whitebox Tests - Checks the dimensions of the dynamically sized pause menu GUI, and
	// Check if it's at least 1 (or not 0 or lower) for all dimensions
	test("Check if xs for Pause Menu Draw GUI is >= 1", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg7,1))
	});
	
	test("Check if ys for Pause Menu Draw GUI >= 1", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg8,1))
	});
}

// Black box Tests for checking the pause functionality in different
// rooms and if dialogue is present, and also check if the pause menu object
// is present when paused and not present when not paused.
// This covers 8 branches for this section
function pause_blackBox_Tests() {	
	// #1 Blacbox Test - If in main menu, then the user should not be able to pause
	if (room == rm_start_test) {
		test("Check pause status in Main Menu", function() {
			gmltest_expect_false(global.isPaused)
		});
	}

	// #2 Blacbox Test - If in main menu, then the user should not be able to pause
	if(room = rm_battle_test) {
		test("Check pause status in Battle Room", function() {
			gmltest_expect_false(global.isPaused)
		});
	}

	// #3 Blacbox Test - If game is paused, then the pause menu object should be present,
	// Else, should not be present
	if(global.isPaused) {
		test("Check pause menu object existence while paused", function() {
			gmltest_expect_true(instance_exists(obj_pause_menu))
		});
	}
	else {
		test("Check pause menu object existence while not paused", function() {
			gmltest_expect_false(instance_exists(obj_pause_menu))
		});
	}
}

// Integration test
// #1 tests the pause function with the dialogue test, if the dialogue text
// is present, then the pause function should be disabled. 
function checkpause_dialoguetest() {
	// #1 If dialogue is present, then the user should not be able to pause
	if (global.isDialogue) {
		test("Check pause status during Dialogue test", function() {
			gmltest_expect_false(global.isPaused)
		});	
	}
}