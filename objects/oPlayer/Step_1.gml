if healthpoints <= 0
{
	room_goto(roDeathScreen)
}

//	KEYBOARD INPUTS
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) or keyboard_check(ord("W"));
key_dash = keyboard_check_pressed(vk_shift);
key_attack_light = keyboard_check_pressed(ord("J"));
key_attack_heavy = keyboard_check_pressed(ord("K"));
key_magic_aoe = keyboard_check_pressed(ord("U"));
key_magic_small = keyboard_check_pressed(ord("I"));
key_magic_infuse = keyboard_check_pressed(186); //Semicolon (;) key
key_magic_heal = keyboard_check_pressed(ord("Q"));