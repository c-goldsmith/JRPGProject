/// @description Location inspector check

var mapSpot = instance_place(x,y,par_mapspot);

if (!(mapSpot == noone) && (keyboard_check_pressed(vk_shift))) {
	if (!(global.isPaused) && !(global.isDialogue)) {
		var daiBox = instance_create_layer(0, 0, "Instances", obj_dialogue);
		daiBox.messageContents = [ 
			mapSpot.spotDesc
		];
		daiBox.messageSpeaker = [
			mapSpot.spotName
		];
		daiBox.messageEmote = [
			undefined
		];
	}
}