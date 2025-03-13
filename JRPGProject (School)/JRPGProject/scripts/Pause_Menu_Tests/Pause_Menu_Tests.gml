// Tests specific for the Pause menu and its submenus

// White box Tests
function pause_whiteBox_Tests() {	
	// #1 Whitebox test - This is for testing array bounds in Draw GUI,
	// expects them to be equal/true, covers 2 branches for true and false
	test("Check array bounds Pause Menu's Draw GUI", function() {
		gmltest_expect_true(isEqualsNum(global.pausetest_arg1,global.pausetest_arg2))
	});
	/* procedure to be tested with this white box test:
	-------------------------------------
	// From obj_pause_menu Draw GUI:
	// Draw the text
	for (var i=0; i<pauseMenuLength; i++) { // Sets color based on current text position, then draws that row of text.
	
		if (pauseMenuPos = i) { // Set color
			draw_set_color(c_black); // Highlighted color
			draw_text(55, 30+(i*22), pauseMenuText[pauseMenuLevel,i]+" <");
		} else {
			draw_set_color(c_grey); // Not highlighted color
			draw_text(55, 30+(i*22), pauseMenuText[pauseMenuLevel,i]);
		}

	}
	checki = i; // Store i's value for testing
	*/

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
	
	/* procedure checked with this white test:
	-------------------------------------
	// From obj_pause_menu Draw GUI:
	// Move up or down the submenu
	pauseMenuPos += down_key_pressed - up_key_pressed;
	if pauseMenuPos >= pauseMenuLength {pauseMenuPos = 0};
	if pauseMenuPos < 0 {pauseMenuPos = pauseMenuLength - 1};
	*/
	
	// #3 Whitebox Tests - For testing the bound of the pause menu level. Mutants may go out of bounds.
	// Covers 4 branches here. This checks the switch statements hardcoding the
	// pause menu level to make sure it's not negative or beyond the bound of the array.
	test("Check if Pause Menu Level is >= 0", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg3,0))
	});
	
	test("Check if Pause Menu Level is <= 3", function() {
		gmltest_expect_true(isLTorEqualsNum(global.pausetest_arg3,global.pausetest_arg4))
	});
		/* Procedure the white test checks for:
	----------------------------------
	// From obj_pause_menu Step:
	checks the pauseMenuLevel variable

	// From obj_pause_menu Press P
	global.pausetest_arg5 = pauseMenuLevel; 
	global.pausetest_arg6 = 3;
	*/
	
	
	// #4 Whitebox Tests - Checks the dimensions of the dynamically sized pause menu GUI, and
	// Check if it's at least 1 (or not 0 or lower) for all dimensions
	test("Check if xs for Pause Menu Draw GUI is >= 1", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg7,1))
	});
	
	test("Check if ys for Pause Menu Draw GUI >= 1 ", function() {
		gmltest_expect_true(isGTorEqualsNum(global.pausetest_arg8,1))
	});
	/* Procedure the white test checks for:
	----------------------------------
	// From obj_pause_menu Draw GUI:
	var xs = new_sprite_w/sprite_width; // xscale of sprite
	var ys = new_sprite_h/sprite_width; // yscale of sprite

	global.pausetest_arg7 = xs; 
	global.pausetest_arg8 = ys;
	*/
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
	
// Helper functions for comparing two numbers, do not count them as tests

///@description Compares two values and checks if they're equal to each other.
///@param {*} valx
///@param {*} valy
function isEqualsNum(valx, valy) {
	if (valx == valy) return true;
	return false;
}

///@description Checks if valx is greater than or equal to valy.
///@param {*} valx
///@param {*} valy
function isGTorEqualsNum(valx, valy) {
	if (valx >= valy) return true;
	return false;
}

///@description Checks if valx is less than or equal to valy.
///@param {*} valx
///@param {*} valy
function isLTorEqualsNum(valx, valy) {
	if (valx <= valy) return true;
	return false;
}