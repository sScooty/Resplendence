ini_open("savedata.ini");
experience = ini_read_real("save1", "experience", 0);
ini_close();

//	INITIATE ALL VARIABLES NEEDED
//	MANY ARE PLACEHOLDER TO BE CHANGED LATER
level = experience * 0.05

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
grv = 0.6; //gravity
jumpheight = -12
walkspd = 6; //walk speed

dashspd = 20 //dash speed
dashcd = 15; //dash cooldown
dashcdbase = 15; //allows dash cooldown to be reset
dashcost = 25; //cost in stamina to dodge
dashing = 0; //allows dashes to take multiple frames for the sake of smoothness

basestamina = 100 + (level*10); //maximum/normal stamina
stamina = basestamina; //sets current stamina to base/max stamina
basestaminarechargecd = 40; //allows stamina recharge rate to be reset to base value
staminarechargecd = basestaminarechargecd; //time before stamina begins to refill
staminarechargerate = 2.5; //rate at which stamina is added back to the player

heavyattackstaminacost = 15; //stamina cost to perform a heavy attack

basehealth = 100 + (level*10); //maximum/normal health
healthpoints = basehealth; //sets current health to base/max health
basehealthrechargecd = 600; //allows health recharge cooldown to be reset to base value
healthrechargecd = basehealthrechargecd; //time before health begins to refill
healthrechargerate = 0.1 + (level*0.02); //rate at which health is added back to the player

baselight = 100 + (level*10);
light = baselight;

lightinfuesecost = 50;
lightsmallattackcost = 10;
lightaoeattackcost = 25;
smallattack = 0;
lighthealcost = 15;
lighthealamount = 35;

ATK = 40 + (level * 3);
RES = 0;
BUFF = 0;
DEF = 0 + (level * 2);

//	KEYBOARD INPUTS
key_left = false;
key_right = false;
key_jump = false;
key_dash = false;
key_attack_light = false;
key_attack_heavy = false;
key_magic_aoe = false;
key_magic_small = false;
key_magic_infuse = false;