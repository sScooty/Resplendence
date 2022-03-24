// ~~~~~~~~~
//	 DEATH
// ~~~~~~~~~

if healthpoints <= 0
{
	oPlayer.light = oPlayer.light + 5
	oPlayer.experience = oPlayer.experience + 15
	instance_destroy();
};