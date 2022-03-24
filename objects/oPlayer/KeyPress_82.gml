/// @description Restart game
ini_open("savedata.ini");
show_debug_message("Reset player XP.");
ini_write_real("save1", "experience", 0);
ini_close();
game_restart();