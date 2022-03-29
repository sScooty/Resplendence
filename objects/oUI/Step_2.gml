// ~~~~~~~~~
//	 LIGHT
// ~~~~~~~~~


if instance_exists(oPlayerLightBar)
{
	oPlayerLightBar.image_xscale = ((oPlayer.light / oPlayer.baselight)*2);
	oPlayerLightBar.x = oCamera.x;
	oPlayerLightBar.y = oCamera.y - 210;
};


// ~~~~~~~~~
//  HEALTH
// ~~~~~~~~~


if instance_exists(oPlayerHealthBar)
{
	oPlayerHealthBar.image_xscale = ((oPlayer.healthpoints / oPlayer.basehealth)*2);
	oPlayerHealthBar.x = oCamera.x - 364;
	oPlayerHealthBar.y = oCamera.y - 210;
};


// ~~~~~~~~~
//	STAMINA
// ~~~~~~~~~


if instance_exists(oPlayerStaminaBar)
{
	oPlayerStaminaBar.image_xscale = - ((oPlayer.stamina / oPlayer.basestamina)*2);
	oPlayerStaminaBar.x = oCamera.x + 236;
	oPlayerStaminaBar.y = oCamera.y - 210;
};


// ~~~~~~~~~
//  ICONS
// ~~~~~~~~~


if instance_exists(oHealIcon)
{
	oHealIcon.image_xscale = 0.5;
	oHealIcon.image_yscale = 0.5;
	oHealIcon.x = oCamera.x - 224;
	oHealIcon.y = oCamera.y - 210;
	if oPlayer.light > oPlayer.lighthealcost
	{
		oHealIcon.image_index = 0;
	};
	else
	{
		oHealIcon.image_index = 1;
	};
};

if instance_exists(oAOEIcon)
{
	oAOEIcon.image_xscale = 0.5;
	oAOEIcon.image_yscale = 0.5;
	oAOEIcon.x = oCamera.x + 76;
	oAOEIcon.y = oCamera.y - 210;
	if oPlayer.light > oPlayer.lightaoeattackcost
	{
		oAOEIcon.image_index = 0;
	};
	else
	{
		oAOEIcon.image_index = 1;
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