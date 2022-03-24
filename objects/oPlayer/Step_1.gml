// ~~~~~~~~~
//	 DEATH
// ~~~~~~~~~

if healthpoints <= 0
{
	room_goto(roDeathScreen)
}

// ~~~~~~~~~
//	 INPUT
// ~~~~~~~~~

key_left = keyboard_check(left);
key_right = keyboard_check(right);
key_jump = keyboard_check(jump);
key_dash = keyboard_check_pressed(dash);
key_attack_light = keyboard_check_pressed(attack);
key_attack_heavy = keyboard_check_pressed(heavyattack);
key_magic_aoe = keyboard_check_pressed(aoemagic);
key_magic_small = keyboard_check_pressed(smallmagic);
key_magic_infuse = keyboard_check_pressed(infuse);
key_magic_heal = keyboard_check_pressed(heal);
key_block = keyboard_check(block);