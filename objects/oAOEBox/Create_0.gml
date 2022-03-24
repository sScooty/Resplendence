alarm[11] = 0.25*room_speed
image_xscale = 3
image_yscale = 3
var _hitlist = ds_list_create();
hitCount = instance_place_list(x,y,oGrunt,_hitlist,true);
repeat(hitCount)
{
	with(ds_list_find_value(_hitlist, 0))
	{
		resshred = 300;
		magicdamagedealt = CalcMagicDamage(oPlayer.ATK, 0, RES);
		with instance_create_layer((x + irandom_range(-16, 8)), (y + irandom_range(-78, -24)), "UI", oDamageText)
			{
				damage = CalcMagicDamage(oPlayer.ATK, oPlayer.BUFF, oGrunt.RES);
			};
		};
	ds_list_delete(_hitlist,0)
};
ds_list_destroy(_hitlist);