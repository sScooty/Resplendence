//	CALCULATES MAGIC DAMAGE DEALT BASED ON INPUTS

function CalcMagicDamage(ATK, BUFF, RES){
	return round((ATK)*(1+(BUFF/100))*(1-(RES/100)));
};