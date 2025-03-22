
// Set up enter x and enter y- should be the default for the room
enterX = 615;
enterY = 1080;

// If exit isn't 0, change to different x and y based on the location of that exit


// Spawn player mover at entrance
playMover = instance_create_layer(enterX, enterY, "Instances", obj_map_mover);

camera_destroy(view_camera[0]);
view_camera[0] = camera_create_view(enterX, enterY, 210, 160, 0, playMover, -1, -1, 105, 80);