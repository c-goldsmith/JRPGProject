/// @description Basic movement

if (keyboard_check(vk_up)) { y-=moveSpd; };
if (keyboard_check(vk_right)) { x+=moveSpd; };
if (keyboard_check(vk_down)) { y+=moveSpd; };
if (keyboard_check(vk_left)) { x-=moveSpd; };