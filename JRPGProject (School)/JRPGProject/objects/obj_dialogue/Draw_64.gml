
// Create the box
if (messageSpeaker[messageProgress] != undefined) {
	draw_sprite_ext(spr_menu_back, 0, 29, 185, (string_width(messageSpeaker[messageProgress])+24)/78, 50/78, 0, c_white, 1);
}
draw_sprite_ext(spr_menu_back, 0, 20, 210, 380/78, 90/78, 0, c_white, 1);

// Check the length of the current message
messageLength = string_length(messageContents[messageProgress]);

// If the entire length of the message hasn't been printed yet
if !(typerProgress >= (messageLength)) {
	
	if ((string_char_at(messageContents[messageProgress], typerProgress) == ".") || (string_char_at(messageContents[messageProgress], typerProgress) == ",")) {
		typerDelay+=0.25; // Progress the text of the message less for a space
	} else {
		typerDelay++; // Progress the normal amount for all other characters
	}
	if (typerDelay == 2) {
		typerDelay = 0;
		typerProgress++;
	}
	
	// If they hit a continue button then skip the typing effect (for skipping dialogue)
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
		typerProgress = messageLength;
		typerDelay = 0;
	}

// If it has been printed, then if a continue button is pressed
} else if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
	if !(messageProgress >= (array_length(messageContents)-1)) {
		// Progress to next message in the dialogue
		messageProgress++;
		typerProgress = 0;
	} else {
		// Otherwise, destroy the dialogue system
		global.isDialogue = false;
		instance_destroy(id);
	}
}

if (messageEmote[messageProgress] == undefined) {
	emoteWidth = 0;
} else {
	emoteWidth = 75;
	draw_sprite(spr_t_outline,0,29,219);
	draw_sprite(messageEmote[messageProgress], 0, 33, 223);
}

// Draw the text
var oldFt = draw_get_font();
draw_set_font(ft_basic);
draw_text_ext(30+emoteWidth, 214, string_copy(messageContents[messageProgress], 1, typerProgress), 20, 360-emoteWidth);
if (messageSpeaker[messageProgress] != undefined) {
	draw_text_ext(35, 188, messageSpeaker[messageProgress], 20, 360);
}
draw_set_font(oldFt);
