/// @description Pause State
if (keyboard_check_pressed(vk_escape)) {
	if (!(global.isPaused) && !(global.isDialogue)) {
		global.isPaused = true;
		obj_map_mover.moveSpd = 0; // Stop player movement
		
		// Get the position of the camera, then add the offsets to create
		// pause menu object. So that the pause menu is positioned with
		// respect to the camera position
		var x_offset = 20;
		var y_offset = 10;
		var vx = camera_get_view_x(view_camera[0]) + x_offset;
		var vy = camera_get_view_y(view_camera[0]) + y_offset;
		
		instance_create_layer(vx, vy,"Instances", obj_pause_menu);
	}
	else {
		global.isPaused = false;
		instance_destroy(obj_pause_menu);
		obj_map_mover.moveSpd = 1; // Set player speed back
	}
}