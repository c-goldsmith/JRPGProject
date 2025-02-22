/// @description DIALOGUE TEST

if (!(global.isPaused) && !(global.isDialogue)) {
	var daiBox = instance_create_layer(0, 0, "Instances", obj_dialogue);
	daiBox.messageContents = [ 
		"tester 1 baby let's go just writing a big ol message here wooooo", 
		"None of this test dialogue is canon!", 
		"(Well, not that anyone should be reading this anyway...)" 
	];
	daiBox.messageSpeaker = [
		undefined,
		"Rosette",
		"Rosette"
	];
	daiBox.messageEmote = [
		undefined,
		tspr_Rosette_Happy_2,
		tspr_Rosette_Happy_1
	];
}
