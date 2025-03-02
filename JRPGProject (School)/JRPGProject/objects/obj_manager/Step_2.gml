/// @description Pause State
if (keyboard_check_pressed(vk_escape)) {
	if (!(global.isPaused) && !(global.isDialogue)) {
		if ((room != rm_start_test) && (room != rm_battle_test)) {
			global.isPaused = true;
			obj_map_mover.moveSpd = 0; // Stop player movement
			
			// Make the instance out of bounds
			instance_create_layer(-200, -200,"Instances", obj_pause_menu);
		}
	}
	else {
		global.isPaused = false;
		if instance_exists(obj_pause_menu) { instance_destroy(obj_pause_menu); }
		if instance_exists(obj_map_mover) { obj_map_mover.moveSpd = 1; }
	}
}