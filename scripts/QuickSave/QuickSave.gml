function QuickSave(){
	var currentroom = room
	ini_open("savedata.ini");
	ini_write_real("save1", "room", currentroom);
	show_debug_message("Attempted to save room information.")
	if instance_exists(oPlayer)
	{
		//ini_write_real("save1", "x", oPlayer.x);
		//ini_write_real("save1", "y", oPlayer.y);
		ini_write_real("save1", "experience", oPlayer.experience);
		show_debug_message("Attempted to save player information.")
	};
	ini_close();
}