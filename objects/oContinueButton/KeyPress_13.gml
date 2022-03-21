if image_index = 0
{
	game_restart()
}

else if image_index = 1
{
	ini_open("savedata.ini");
	ini_write_real("save1", "experience", oGame.experience);
	ini_close();
	game_end()
}