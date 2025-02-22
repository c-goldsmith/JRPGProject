// Can't get this to work, this is an issue
if (!(global.isPaused) && !(global.isDialogue)) {
	instance_deactivate_all(true); // deactivate other objects
	global.pauseMenuInst = create_instance_layer(20, 20,"Instances", obj_pause_menu);
	global.isPaused = true;
}
else {
	global.isPaused = false;
	destroy_instance_layer(global.pauseMenuInst);
	instance_activate_all(); // activate other objects
}
