// ~~~~~~~~~
//	 LIGHT
// ~~~~~~~~~


if instance_exists(oPlayerLightBar)
{
	oPlayerLightBar.image_yscale = 1;
	oPlayerLightBar.image_xscale = (((oPlayer.light / oPlayer.baselight)/64)*128);
	oPlayerLightBar.x = oCamera.x;
	oPlayerLightBar.y = oCamera.y - 195;
};


// ~~~~~~~~~
//  HEALTH
// ~~~~~~~~~


if instance_exists(oPlayerHealthBar)
{
	oPlayerHealthBar.image_yscale = 1;
	oPlayerHealthBar.image_xscale = (((oPlayer.healthpoints / oPlayer.basehealth)/64)*128);
	oPlayerHealthBar.x = oCamera.x - 364;
	oPlayerHealthBar.y = oCamera.y - 195;
};


// ~~~~~~~~~
//	STAMINA
// ~~~~~~~~~


if instance_exists(oPlayerStaminaBar)
{
	oPlayerStaminaBar.image_yscale = 1;
	oPlayerStaminaBar.image_xscale = - (((oPlayer.stamina / oPlayer.basestamina)/64)*128);
	oPlayerStaminaBar.x = oCamera.x + 236;
	oPlayerStaminaBar.y = oCamera.y - 195;
};


// ~~~~~~~~~
//  ICONS
// ~~~~~~~~~


if instance_exists(oHealIcon)
{
	oHealIcon.image_xscale = 1
	oHealIcon.image_yscale = 1
	oHealIcon.x = oCamera.x - 224;
	oHealIcon.y = oCamera.y - 195;
	if oPlayer.light > oPlayer.lighthealcost
	{
		oHealIcon.image_index = 0;
	};
	else
	{
		oHealIcon.image_index = 1;
	};
};


// ~~~~~~~~~
//   TEXT
// ~~~~~~~~~

if instance_exists(oPlayer)
{
	var leveltextx = oPlayer.x;
	var leveltexty = oPlayer.y;
	draw_text_color(leveltextx, leveltexty, "Appears!", c_white, c_white, c_white, c_white, 1);
};