if rightside = true
{
	x = oPlayer.x + 24;
	y = oPlayer.y + 4;
	image_xscale = 2;
};

else if leftside = true
{
	x = oPlayer.x - 24;
	y = oPlayer.y + 4;
	image_xscale = -2;
};
if heavy = true
{
	image_speed = 0.5;
};
else
{
	image_speed = 1;
};
if infused > 0
{
	sprite_index = sSwordSlashInfused;
};

else
{
	sprite_index = sSwordSlash;
};