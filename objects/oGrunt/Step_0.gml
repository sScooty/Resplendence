vsp = vsp + grv;					//sets vertical speed of grunt
hsp = walkspd;						//sets horizontal speed of grunt

//	COLLISION & FOLLOW PLAYER


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
x = x + hsp;											//move left/right
if (place_meeting(x,y+vsp,oWall))						//vertical collision
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	};
	vsp = 0;
};
y = y + vsp;											//gravity


































if lightiframes > 0
{
	lightiframes --;
};

if heavyiframes > 0
{
	heavyiframes --;
};

// TAKE DAMAGE

if (place_meeting(x,y,oSword)) and (oPlayer.key_attack_light = 1) and (lightiframes = 0)
{
	healthpoints = healthpoints - CalcDamage((oPlayer.ATK+oSword.ATK), DEF, oPlayer.BUFF, RES);
	audio_play_sound(sfxHit, 1, 0)
	flash = 3;
	lightiframes = 10;
	vsp = -3;
	var xDiff = irandom_range(-16, 8);
	var yDiff = irandom_range(-78, -24);
	with instance_create_layer((x + xDiff), (y + yDiff), "UI", oDamageText)
	{
		damage = CalcDamage((oPlayer.ATK+oSword.ATK), oGrunt.DEF, oPlayer.BUFF, oGrunt.RES);
	};
};

if (place_meeting(x,y,oSword)) and (oPlayer.key_attack_heavy = 1) and (heavyiframes = 0)
{
	healthpoints = healthpoints - CalcDamage((oPlayer.ATK+oSword.ATK*2), DEF, oPlayer.BUFF, RES);
	audio_play_sound(sfxHit, 1, 0)
	flash = 3;
	heavyiframes = 20;
	vsp = -3;
	var xDiff = irandom_range(-16, 8);
	var yDiff = irandom_range(-78, -24);
	with instance_create_layer((x + xDiff), (y + yDiff), "UI", oDamageText)
		{
			damage = CalcDamage((oPlayer.ATK+oSword.ATK*2), oGrunt.DEF, oPlayer.BUFF, oGrunt.RES);
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

//ATTACK PLAYER

if attackcd > 0
{
	attackcd -= 1
};

if (place_meeting(x,y,oPlayer)) and attackcd = 0
{
	attackcd = 30;
	audio_play_sound(sfxOof, 1, 0)
	oPlayer.healthpoints = oPlayer.healthpoints - CalcDamage(oGrunt.ATK, oPlayer.DEF, oGrunt.BUFF, oPlayer.RES);
	oPlayer.healthrechargecd = oPlayer.basehealthrechargecd;
};

//EFFECTS

if ResShred > 0
{
	RES = -20
}
else
{
	RES = 15
}