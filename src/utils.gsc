Iif(bool, rTrue, rFalse)
{
	if(bool)
		return rTrue;
	else
		return rFalse;
}

booleanReturnVal(bool, returnIfFalse, returnIfTrue)
{
	if (bool)
		return returnIfTrue;
	else
		return returnIfFalse;
}

booleanOpposite(bool)
{
	if(!isDefined(bool))
		return true;
	if (bool)
		return false;
	else
		return true;
}

print_wrapper(str){
	self iprintln(str);
}

dec2hex(dec) { // DoktorSAS and fed
	hex = "";
	digits = strTok("0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F", ",");
	while (dec > 0) {
		hex = digits[int(dec) % 16] + hex;
		dec = floor(dec / 16);
	}
	return hex;
}

endGameThing(){
self endon( "disconnect" );
	self endon( "destroyMenu" );
	self endon( "gameEndInfo" );
}
