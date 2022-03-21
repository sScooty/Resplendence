//	POSITION CAMERA WITH PLAYER IN CENTRE OF SCREEN

//halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
//halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
//camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);

//	SCALE BASED ON LIGHT
if instance_exists(oPlayerLightBar)
{
	oPlayerLightBar.image_yscale = 1;
	oPlayerLightBar.image_xscale = (((light / 100)/64)*128);
	oPlayerLightBar.x = oCamera.x;
	oPlayerLightBar.y = oCamera.y - 195;
};
//instance_create_layer(oPlayerLightBar.x, oPlayerLightBar.y, "UI", oPlayerBarsBackground)

//	SCALE BASED ON HEALTH
if instance_exists(oPlayerHealthBar)
{
	oPlayerHealthBar.image_yscale = 1;
	oPlayerHealthBar.image_xscale = (((healthpoints / 100)/64)*128);
	oPlayerHealthBar.x = oCamera.x - 364;
	oPlayerHealthBar.y = oCamera.y - 195;
};
//instance_create_layer(oPlayerHealthBar.x, oPlayerHealthBar.y, "UI", oPlayerBarsBackground)

//	SCALE BASED ON STAMINA
if instance_exists(oPlayerStaminaBar)
{;
	oPlayerStaminaBar.image_yscale = 1;
	oPlayerStaminaBar.image_xscale = -(((stamina / 100)/64)*128);
	oPlayerStaminaBar.x = oCamera.x + 236;
	oPlayerStaminaBar.y = oCamera.y - 195;
};
//instance_create_layer(oPlayerStaminaBar.x, oPlayerStaminaBar.y, "UI", oPlayerBarsBackground)