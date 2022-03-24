// ~~~~~~~~~
//	 STATS
// ~~~~~~~~~

//	STAMINA

if (staminarechargecd > 0)								//reduces cooldown on stamina beginning to recharge
{
	staminarechargecd = staminarechargecd - 1;
}
else if (staminarechargecd = 0) and (stamina < basestamina)  //adds stamina back to player
{
	stamina = stamina + staminarechargerate;
};
if (stamina > basestamina)								//ensures stamina never goes above maximum
{
	stamina = basestamina;
};

//	HEALTH

if (healthrechargecd > 0)								//reduces cooldown on health beginning to recharge
{
	healthrechargecd = healthrechargecd - 1;
}
if (healthrechargecd = 0) and (healthpoints < basehealth)  //adds health back to player
{
	healthpoints = healthpoints + healthrechargerate;
};
if (healthpoints > basehealth)							//ensures health never goes above maximum
{
	healthpoints = basehealth;
};

// LIGHT

if light > baselight
{
	light = baselight
}


// ~~~~~~~~~
//	MOVEMENT
// ~~~~~~~~~


//	HORIZONTAL MOVEMENT

var move = key_right - key_left;						//calculate movement
if move < 0
{
	sprite_index = sPlayerSideMoving;
	image_xscale = 2;
};
else if move > 0
{
	sprite_index = sPlayerSideMoving;
	image_xscale = -2;
};
else
{
	sprite_index = sPlayerForward;
};
hsp = move * walkspd;									//sets horizontal speed of player
vsp = vsp + grv;										//sets vertical speed of player

//	DASH

if not (dashcd = 0)										//lowers the dash cooldown
{
	dashcd = dashcd - 1;
};
if dashing > 0											//continues dash if one was initiated in previous frames
{
	dashing = dashing - 1;
	hsp = move * dashspd;
	RES = 100;
};
else if (key_dash) and (dashcd = 0) and (stamina >= dashcost) and ((key_left) xor (key_right)) //initiates dash
{
	dashing = 5;
	hsp = move * dashspd;
	RES = 100;
	dashcd = dashcdbase;
	stamina = stamina - dashcost;
	staminarechargecd = basestaminarechargecd;
};
else
{
	RES = 0;
};

if (place_meeting(x+hsp,y,oWall))						//horizontal collision
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	};
	hsp = 0;
};

//	VERTICAL MOVEMENT

if (place_meeting(x,y+vsp,oWall))						//vertical collision
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	};
	vsp = 0;
};
if (place_meeting(x,y+1,oWall)) and (key_jump)			//jump
{
	vsp = jumpheight;
};


// ~~~~~~~~~
//	 MAGIC
// ~~~~~~~~~


if (key_magic_aoe) and (light >= lightaoeattackcost)	//large area of effect attack
{
	light = light - lightaoeattackcost;
	instance_create_layer(x, y, layer, oAOEBox);
};
if (key_magic_small) and (light >= lightsmallattackcost)	//small area of effect attack
{
	light = light - lightsmallattackcost;
	smallattack = 1;
};
if (key_magic_infuse) and (light >= lightinfuesecost)	//infuse weapon
{
	light = light - lightinfuesecost;
	oSword.infused = 300;
};

if (key_magic_heal) and (light >= lighthealcost) and (healthpoints < basehealth)	//heal
{
	light = light - lighthealcost;
	if ((healthpoints + lighthealamount) > basehealth)
	{
		healthpoints = basehealth
	};
	else
	{
		healthpoints = healthpoints + lighthealamount;
	};
};


// ~~~~~~~~~
//	COMBAT
// ~~~~~~~~~

if key_block
{
	hsp = hsp/3;
	RES = 75;
	blocking = true;
};
else
{
	RES = 0;
	blocking = false;
};
if key_attack_light and oSword.attacking = 0 and blocking = false //initiates light attack
{
	oSword.attacking = 10;
	oSword.heavy = false;
	oSword.image_index = 0;
	audio_play_sound(sfxSwipe, 1, 0);
};
else if key_attack_heavy and stamina >= heavyattackstaminacost and oSword.attacking = 0 and blocking = false //initiates heavy attack
{
	stamina = stamina - heavyattackstaminacost;
	staminarechargecd = basestaminarechargecd;
	oSword.attacking = 20;
	oSword.heavy = true;
	oSword.image_index = 0;
	audio_play_sound(sfxHeavy, 1, 0);
};
x = x + hsp;											//move left/right
y = y + vsp;											//vertical movement