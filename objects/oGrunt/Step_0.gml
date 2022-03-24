// ~~~~~~~~~
//	MOVEMENT
// ~~~~~~~~~

vsp = vsp + grv;					//sets vertical speed of grunt

if x-oPlayer.x > 0 and x-oPlayer.x < 512
	{
		hsp = walkspd * -1;
	};
else if x-oPlayer.x < 0 and x-oPlayer.x > -512
	{
		hsp = walkspd;
	};
else
	{
		hsp = 0;
	};
if (place_meeting(x+hsp,y,oWall))						//horizontal collision
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		};
		hsp = 0;
		vsp = jumpheight;
	};
if (place_meeting(x,y+vsp,oWall))						//vertical collision
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	};
	vsp = 0;
};
x = x + hsp;											//move left/right
y = y + vsp;											//gravity

// ~~~~~~~~~
//	DAMAGE
// ~~~~~~~~~

if (place_meeting(x,y,oSword)) and (oPlayer.key_attack_light = 1) and oPlayer.blocking = false
{
	healthpoints = healthpoints - CalcDamage(oPlayer.ATK, DEF, oPlayer.BUFF, RES);
	audio_play_sound(sfxHit, 1, 0)
	flash = 3;
	vsp = -3;
	var xDiff = irandom_range(-16, 8);
	var yDiff = irandom_range(-78, -24);
	with instance_create_layer((x + xDiff), (y + yDiff), "UI", oDamageText)
	{
		damage = CalcDamage(oPlayer.ATK, oGrunt.DEF, oPlayer.BUFF, oGrunt.RES);
	};
};

if (place_meeting(x,y,oSword)) and (oPlayer.key_attack_heavy = 1) and oPlayer.blocking = false
{
	healthpoints = healthpoints - CalcDamage(oPlayer.ATK*2, DEF, oPlayer.BUFF, RES);
	audio_play_sound(sfxHit, 1, 0)
	flash = 3;
	vsp = -3;
	var xDiff = irandom_range(-16, 8);
	var yDiff = irandom_range(-78, -24);
	with instance_create_layer((x + xDiff), (y + yDiff), "UI", oDamageText)
		{
			damage = CalcDamage(oPlayer.ATK*2, oGrunt.DEF, oPlayer.BUFF, oGrunt.RES);
		};
};
	if (magicdamagedealt > 0)
	{
	healthpoints = healthpoints - magicdamagedealt;
	audio_play_sound(sfxHit, 1, 0)
	flash = 3;
	vsp = -4;
	magicdamagedealt = 0;
	};

// ~~~~~~~~~
//	ATTACK
// ~~~~~~~~~

if attackcd > 0
{
	attackcd -= 1
};

if (place_meeting(x,y,oPlayer)) and attackcd = 0
{
	attackcd = 30;
	audio_play_sound(sfxPain, 1, 0)
	oPlayer.healthpoints = oPlayer.healthpoints - CalcDamage(oGrunt.ATK, oPlayer.DEF, oGrunt.BUFF, oPlayer.RES);
	oPlayer.healthrechargecd = oPlayer.basehealthrechargecd;
};

// ~~~~~~~~~
//	EFFECTS
// ~~~~~~~~~

if resshred > 0
{
	RES = -20;
};
else
{
	RES = 15;
};