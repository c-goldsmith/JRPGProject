/// @description Basic movement

var oldX = x;
var oldY = y;

 // Reset moving variables
moveY = 0;
moveX = 0;

 // Keyboard movement check
if ((global.isPaused == false) && (global.isDialogue == false)) {
	if (place_meeting(x, y, layer_tilemap_get_id("WalkSpeed"))) {
		moveSpd = 0.75;
	} else {
		moveSpd = 1;
	}
	
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
		moveY -= moveSpd; 
		sprIdle = spr_bigmap_mover_north_idle;
		sprWalk = spr_bigmap_mover_north_walk;
	} else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) { 
		moveY += moveSpd; 
		sprIdle = spr_bigmap_mover_south_idle;
		sprWalk = spr_bigmap_mover_south_walk; 
	};

	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) { 
		moveX += moveSpd; 
		sprIdle = spr_bigmap_mover_east_idle;
		sprWalk = spr_bigmap_mover_east_walk;
	} else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) { 
		moveX -= moveSpd; 
		sprIdle = spr_bigmap_mover_west_idle;
		sprWalk = spr_bigmap_mover_west_walk;
	}
}

// Sprite change logic (animated walking
if !(keyboard_check(vk_up) || (keyboard_check(ord("W")))
	|| (keyboard_check(vk_down)) || (keyboard_check(ord("S")))
	|| (keyboard_check(vk_left)) || (keyboard_check(ord("A")))
	|| (keyboard_check(vk_right)) || (keyboard_check(ord("D")))) || (global.isPaused) || (global.isDialogue)
	{
	sprite_index = sprIdle;
} else {
	sprite_index = sprWalk;	
}

 // Actual movement logic
move_and_collide(moveX, moveY, layer_tilemap_get_id("Bounding"), 4, 0, 0, moveSpd, moveSpd);

if (x != oldX) || (y != oldY) {
	charSteps += travelSpd;
	
	if (charSteps >= 100) {
		charSteps = 0;
		global.worldDate = advance_date(global.worldDate.day, global.worldDate.month, global.worldDate.year);
		
		if (holiday_check(global.worldDate.day, global.worldDate.month, "Exists")) {
			if (global.holidays[holiday_check(global.worldDate.day, global.worldDate.month, "Index")] == 0) {
				var daiBox = instance_create_layer(0, 0, "Instances", obj_dialogue);
				daiBox.messageContents = holiday_check(global.worldDate.day, global.worldDate.month, "Contents");
				daiBox.messageSpeaker = holiday_check(global.worldDate.day, global.worldDate.month, "Speakers");
				daiBox.messageEmote = holiday_check(global.worldDate.day, global.worldDate.month, "Emotes");

				global.holidays[holiday_check(global.worldDate.day, global.worldDate.month, "Index")] = 1;
			}
		}
	}
	
	
}
