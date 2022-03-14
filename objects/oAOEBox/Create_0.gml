var _hitlist = ds_list_create();
hitCount = instance_place_list(x,y,oGrunt,_hitlist,true);
repeat(hitCount)
{
	with(ds_list_find_value(_hitlist, 0))
	{
		oGrunt.RES -= 35
		oGrunt.magicdamagedealt = CalcMagicDamage(oPlayer.ATK, irandom_range(0,35), oGrunt.RES);
		with instance_create_layer((oGrunt.x + irandom_range(-16, 8)), (oGrunt.y + irandom_range(-78, -24)), 0, oDamageText)
			{
				damage = oGrunt.magicdamagedealt;
			};
		};
	ds_list_delete(_hitlist,0)
};
ds_list_destroy(_hitlist);
instance_destroy();