
// Set up enter x and enter y- should be the default for the room
enterX = 100;
enterY = 100;

// If exit isn't 0, change to different x and y based on the location of that exit


// Spawn player mover at entrance
playMover = instance_create_layer(enterX, enterY, "Instances", obj_map_mover);

camera_destroy(view_camera[0]);
view_camera[0] = camera_create_view(enterX, enterY, 320, 320, 0, playMover, -1, -1, 160, 160);