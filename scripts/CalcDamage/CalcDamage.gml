//	CALCULATES DAMAGE DEALT BASED ON INPUTS

function CalcDamage(ATK, DEF, BUFF, RES){
	return round((ATK-DEF)*(1+(BUFF/100))*(1-(RES/100)))
}