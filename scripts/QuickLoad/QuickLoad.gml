function QuickLoad(){
	ini_open("savedata.ini");
	//var playerx = ini_read_real("save1", "x", 0);
	//var playery = ini_read_real("save1", "y", 0);
	room_goto(ini_read_real("save1", "room", roMainMenu));
	show_debug_message("Attempted to load room information.")
	if instance_exists(oPlayer)
	{
		//oPlayer.x = playerx
		//oPlayer.y = playery
		oPlayer.experience = ini_read_real("save1", "experience", oPlayer.experience);
		show_debug_message("Attempted to load player information.")
	};
	ini_close();
}