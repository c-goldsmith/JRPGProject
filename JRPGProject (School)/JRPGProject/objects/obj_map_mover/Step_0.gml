/// @description Basic movement

if (keyboard_check(vk_up) || keyboard_check(ord("W"))) { y-=moveSpd; };
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) { x+=moveSpd; };
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) { y+=moveSpd; };
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) { x-=moveSpd; };