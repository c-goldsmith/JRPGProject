if(global.messageToShow != 0)
{
	//if message to show - turns visible
	visible = 1;
}


if (keyboard_check_pressed(vk_space) && visible == 1)
{
	//progresses through dialogue
	global.messagesLeft--;
	//if reaches end - closes it
	if(global.messagesLeft == 0)
	{
		alarm[0] = 0.05 * game_get_speed(gamespeed_fps);
	}
}
