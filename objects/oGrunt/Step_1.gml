if healthpoints <= 0
{
	oPlayer.light = oPlayer.light + 20
	oPlayer.experience = oPlayer.experience + 15
	instance_destroy();
};