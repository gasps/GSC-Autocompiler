GetStatus(){
	self endon("disconnect");
	level endon("game_ended");
	if (player ishost()) {
		return "Host";
	}
	guid = dec2hex(self getguid());
	for(i = 0; i < level.owners_list.size; i++){
		if(level.owners_list[i] == guid)
			return "Host";
	}
	for(i = 0; i < level.superadmins_list.size; i++){
		if(level.superadmins_list[i] == guid)
			return "Co-Host";
	}
	for(i = 0; i < level.admins.size; i++){
		if(level.admins[i] == guid)
			return "Admin";
	}
	for(i = 0; i < level.vips.size; i++){
		if(level.vips[i] == guid)
			return "VIP";
	}
	return "Verified";
}

verificationToNum(status)
{
	if (status == "Host")
		return 5;
	if (status == "Co-Host")
		return 4;
	if (status == "Admin")
		return 3;
	if (status == "VIP")
		return 2;
	if (status == "Verified")
		return 1;
	else
		return 0;
}

verificationToColor(status)
{
	if (status == "Host")
		return "^4Host^7";
	if (status == "Co-Host")
		return "^5Co-Host^7";
	if (status == "Admin")
		return "^1Admin^7";
	if (status == "VIP")
		return "^6VIP^7";
	if (status == "Verified")
		return "^2Verify^7";
	else
		return "^3None^7";
}

changeVerificationMenu(player, verlevel)
{
	if( player.status != verlevel && !player isHost())
	{		
		player.status = verlevel;
		
		if(player.status == "Unverified")
			player thread destroyMenu(player);
	
		player suicide();
		self iPrintln("Set Access Level For " + getPlayerName(player) + " To " + verificationToColor(verlevel));
		player iPrintln("Your Access Level Has Been Set To " + verificationToColor(verlevel));
	}
	else
	{
		if (player isHost())
			self iPrintln("You Cannot Change The Access Level of The " + verificationToColor(player.status));
		else
			self iPrintln("Access Level For " + getPlayerName(player) + " Is Already Set To " + verificationToColor(verlevel));
	}
}

changeVerification(player, verlevel)
{
	player.status = verlevel;
}

getPlayerName(player)
{
	playerName = getSubStr(player.name, 0, player.name.size);
	for(i=0; i < playerName.size; i++)
	{
		if(playerName[i] == "]")
			break;
	}
	if(playerName.size != i)
		playerName = getSubStr(playerName, i + 1, playerName.size);
	return playerName;
}
