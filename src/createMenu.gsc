CreateMenu()
{
	self add_menu(self.menuname, undefined, "Unverified");

	// main mods

	self add_option(self.menuname, "Main Mods", ::submenu, "Main Mods");
	self add_menu("Main Mods", self.menuname, "Verified");

	self add_option("Main Mods", "Godmode", ::Godmode);
	self add_option("Main Mods", "Demi God", ::Demigod);
	self add_option("Main Mods", "Unlimited Ammo", ::toggleUnlimitedAmmo);
	self add_option("Main Mods", "Max Ammo", ::MaxAmmo);
	self add_option("Main Mods", "Trickshot Perks", ::TrickshotPerks);
	self add_option("Main Mods", "All Streaks", ::AllStreaks);
	self add_option("Main Mods", "Change Class", ::ChangeClass);
			if(getDvar("g_gametype") != "dm")
				{
					self add_option("Main Mods", "Change Team", ::initChangeTeam);
				}
	self add_option("Main Mods", "Force Host", ::ForceHost);
	self add_option("Main Mods", "UAV", ::EnableUAV);
	self add_option("Main Mods", "ESP", ::EnableESP);
	self add_option("Main Mods", "Speed", ::ToggleSpeed);
	self add_option("Main Mods", "Invisible", ::ToggleInvisible);
	self add_option("Main Mods", "Advanced UFO", ::ToggleUFOMode);

	//main mods page 2

    self add_option("Main Mods", "^5--> Page 2^7", ::submenu, "Main Mods2", "Main Mods2");
    self add_menu("Main Mods2", "Main Mods", "Co-Host");

	self add_option("Main Mods2", "Unlock All Trophies", ::UnlockAllTrophies);
	self add_option("Main Mods2", "Field Of View", ::FieldOfView);
	self add_option("Main Mods2", "Suicide", ::Suicide);

	//aimbots

	self add_option(self.menuname, "Aimbots", ::submenu, "Aimbots", "Aimbots");
	self add_menu("Aimbots", self.menuname, "Co-Host");

	self add_option("Aimbots", "Tomahawk Aimbot", ::TomahawkAimbot);
	self add_option("Aimbots", "Shitty Tomahawk Aimbot", ::ShittyTomahawkAimbot);
	self add_option("Aimbots", "Crosshair Aimbot {Sniper}", ::CrosshairAimbot_SNIPER);
	self add_option("Aimbots", "Crosshair Aimbot {FAL/SMR}", ::CrosshairAimbot_SAR);
	self add_option("Aimbots", "Explosive Bullets", ::ExplosiveBullets);
	self add_option("Aimbots", "Unfair Aimbot", ::UnfairAimbot);
	self add_option("Aimbots", "Legit Aimbot", ::LegitAimbot);
	self add_option("Aimbots", "Trickshot Aimbot", ::TrickshotAimbot);
	self add_option("Aimbots", "No Scope Aimbot", ::NoScopeAimbot);

	//lobby menu

	self add_option(self.menuname, "Lobby Menu", ::submenu, "Lobby Menu", "Lobby Menu");
	self add_menu("Lobby Menu", self.menuname, "Co-Host");

	self add_option("Lobby Menu", "Trickshot Lobby", ::TrickshotLobby);
	self add_option("Lobby Menu", "Hear All", ::HearAll);
	self add_option("Lobby Menu", "Unlimited Game", ::UnlimitedGame);
	self add_option("Lobby Menu", "Anti-Quit", ::AntiQuit);
	self add_option("Lobby Menu", "Low Gravity", ::LowGravity);
	self add_option("Lobby Menu", "Super Jump", ::SuperJump);
	self add_option("Lobby Menu", "Super Speed", ::SuperSpeed);
	self add_option("Lobby Menu", "Map Restart", ::MapRestart);
	if (self isHost())
	{
		self add_option("Lobby Menu", "Instant End Game", ::InstantEndGame); // requires host

	}
	self add_option("Lobby Menu", "Timescale", ::Timescale);
	self add_option("Lobby Menu", "Locked Lobby", ::LockedLobby);
	self add_option("Lobby Menu", "End Game", ::EndGame);

	//lobby menu page 2

	self add_option("Lobby Menu", "^5--> Page 2^7", ::submenu, "Lobby Menu2", "Lobby Menu2");
	self add_menu("Lobby Menu2", "Lobby Menu", "Co-Host");

	self add_option("Lobby Menu2", "Remove Sky Barrier", ::RemoveSkyBarrier);
	self add_option("Lobby Menu2", "Floaters", ::Floaters);
	self add_option("Lobby Menu2", "DoHeart", ::doHeart);

	//lobby menu map related

	self add_option("Lobby Menu", "^5--> Maps^7", ::submenu, "Maps", "Maps");
	self add_menu("Maps", "Lobby Menu", "Co-Host");

	self add_option("Maps", "Nuketown 2025", ::ChangeMap, "mp_nuketown_2020");
	self add_option("Maps", "Aftermath", ::ChangeMap, "mp_la");
	self add_option("Maps", "Cargo", ::ChangeMap, "mp_dockside");
	self add_option("Maps", "Carrier", ::ChangeMap, "mp_carrier");
	self add_option("Maps", "Drone", ::ChangeMap, "mp_drone");
	self add_option("Maps", "Express", ::ChangeMap, "mp_express");
	self add_option("Maps", "Hijacked", ::ChangeMap, "mp_hijacked");
	self add_option("Maps", "Meltdown", ::ChangeMap, "mp_overflow");
	self add_option("Maps", "Plaza",::ChangeMap, "mp_nightclub");
	self add_option("Maps", "Raid", ::ChangeMap, "mp_raid");
	self add_option("Maps", "Slums", ::ChangeMap, "mp_slums");
	self add_option("Maps", "Standoff", ::ChangeMap, "mp_village");
	self add_option("Maps", "Turbine", ::ChangeMap, "mp_turbine");
	self add_option("Maps", "Yemen", ::ChangeMap, "mp_socotro");

	self add_option("Maps", "^5--> DLC Maps^7", ::submenu, "DLC Maps", "DLC Maps");
	self add_menu("DLC Maps", "Maps", "Co-Host");

	self add_option("DLC Maps", "Downhill", ::ChangeMap, "mp_downhill");
	self add_option("DLC Maps", "Mirage", ::ChangeMap, "mp_mirage");
	self add_option("DLC Maps", "Hydro", ::ChangeMap, "mp_hydro");
	self add_option("DLC Maps", "Grind", ::ChangeMap, "mp_skate");
	self add_option("DLC Maps", "Encore", ::ChangeMap, "mp_concert");
	self add_option("DLC Maps", "Magma", ::ChangeMap, "mp_magma");
	self add_option("DLC Maps", "Vertigo", ::ChangeMap, "mp_vertigo");
	self add_option("DLC Maps", "Studio", ::ChangeMap, "mp_studio");
	self add_option("DLC Maps", "Uplink", ::ChangeMap, "mp_uplink");
	self add_option("DLC Maps", "Detour", ::ChangeMap, "mp_bridge");
	self add_option("DLC Maps", "Cove", ::ChangeMap, "mp_castaway");
	self add_option("DLC Maps", "Rush", ::ChangeMap, "mp_paintball");
	self add_option("DLC Maps", "Dig", ::ChangeMap, "mp_dig");
	self add_option("DLC Maps", "Frost", ::ChangeMap, "mp_frostbite");
	self add_option("DLC Maps", "Pod", ::ChangeMap, "mp_pod");
	self add_option("DLC Maps", "Takeoff", ::ChangeMap, "mp_takeoff");

	//trickshot menu

	self add_option(self.menuname, "Trickshot Menu", ::submenu, "Trickshot Menu", "Trickshot Menu");
	self add_menu("Trickshot Menu", self.menuname, "Co-Host");
	self add_option("Trickshot Menu", "^5--> Trickshot Classes", ::submenu, "Trickshot Classes", "Trickshot Classes");
	self add_menu("Trickshot Classes", "Trickshot Menu", "Co-Host");
	self add_option("Trickshot Menu", "^5--> Canswap Menu^7", ::submenu, "Canswap Menu", "Canswap Menu");
	self add_menu("Canswap Menu", "Trickshot Menu", "Co-Host");
	

	self add_option("Trickshot Menu", "Bind Nac Swap to [{+actionslot 4}]");
	self add_option("Trickshot Menu", "Testing Function", ::ToggleBindBounce);
	self add_option("Trickshot Menu", "Add 1 Kill (FFA)", ::add1Kill);
	self add_option("Trickshot Menu", "Add 5 Kills (FFA)", ::add5Kills);
	self add_option("Trickshot Menu", "Add 10 Kills (FFA)", ::add10Kills);
	self add_option("Trickshot Menu", "Add 29 Kills (FFA)", ::add29Kills);
	self add_option("Trickshot Menu", "Instant Last (FFA & TDM)", ::InstantLast);

	self add_option("Canswap Menu", "Remington", ::Canswap, "870mcs_mp");
	self add_option("Canswap Menu", "M1216", ::Canswap, "srm1216_mp");
	self add_option("Canswap Menu", "MSMC", ::Canswap, "insas_mp+sf");
	self add_option("Canswap Menu", "MP7", ::Canswap, "mp7_mp+sf");
	self add_option("Canswap Menu", "M27", ::Canswap, "hk416_mp+sf");
	self add_option("Canswap Menu", "Type 25", ::Canswap, "type95_mp+sf");
	self add_option("Canswap Menu", "Ballista", ::Canswap, "ballista_mp+steadyaim");
	self add_option("Canswap Menu", "DSR", ::Canswap, "dsr50_mp+steadyaim");
	self add_option("Canswap Menu", "HAMR", ::Canswap, "hamr_mp");
	self add_option("Canswap Menu", "QBB LSW", ::Canswap, "qbb95_mp");
	self add_option("Canswap Menu", "Ballistic Knife", ::Canswap, "knife_ballistic_mp");
	self add_option("Canswap Menu", "Riot Shield", ::Canswap, "riotshield_mp");

	self add_option("Trickshot Classes", "Hybrid Nac");
	self add_option("Trickshot Classes", "Selectfire Nac");
	self add_option("Trickshot Classes", "Titty Nac");
	self add_option("Trickshot Classes", "Moni Nac");

	//teleport menu

	self add_option(self.menuname, "Teleport Menu", ::submenu, "Teleport Menu", "Teleport Menu");
	self add_menu("Teleport Menu", self.menuname, "Co-Host");

	self add_option("Teleport Menu", "Save Location");
	self add_option("Teleport Menu", "Load Location");
	self add_option("Teleport Menu", "Save & Load");
	self add_option("Teleport Menu", "Custom Teleport");
	if(getDvar("mapname") == "mp_carrier")
	{
		self add_option("Teleport Menu", "^5--> Carrier Menu^7", ::submenu, "Carrier Menu", "Carrier Menu");
		self add_menu("Carrier Menu", "Teleport Menu", "Co-Host");

		self add_option("Carrier Menu", "Platform @ Location 1");
		self add_option("Carrier Menu", "Platform @ Location 2");
		self add_option("Carrier Menu", "1800 Spot");
		self add_option("Carrier Menu", "Ramp");
		self add_option("Carrier Menu", "James Bond");
		self add_option("Carrier Menu", "Back Of The Boat");
		self add_option("Carrier Menu", "Out Of Map");

	} else {
		if(getDvar("mapname") == "mp_studio")
		{
			self add_option("Teleport Menu", "^5--> Studio Menu^7", ::submenu, "Studio Menu", "Studio Menu");
			self add_menu("Studio Menu", "Teleport Menu", "Co-Host");

			self add_option("Studio Menu", "Platform @ Location 1");
			self add_option("Studio Menu", "Platform @ Location 2");
			self add_option("Studio Menu", "Top Of Castle");
			self add_option("Studio Menu", "Loz Spot");
			self add_option("Studio Menu", "Top of Tower");
			self add_option("Studio Menu", "Wood House");
		}
	}

	//bot menu

	self add_option(self.menuname, "Bot Menu", ::submenu, "Bot Menu", "Bot Menu");
	self add_menu("Bot Menu", self.menuname, "Co-Host");

	self add_option("Bot Menu", "Spawn 1 Bot");
	self add_option("Bot Menu", "Spawn 3 Bot");
	self add_option("Bot Menu", "Spawn 9 Bot");
	self add_option("Bot Menu", "Fill Lobby");
	self add_option("Bot Menu", "Freeze Bot");
	self add_option("Bot Menu", "Teleport To Crosshair");
	self add_option("Bot Menu", "Make Bot Look @ You");
	self add_option("Bot Menu", "Kick Bots");

	//weapons
	
	self add_option(self.menuname, "Weapons", ::submenu, "Weapons", "Weapons");
	self add_menu("Weapons", self.menuname, "Co-Host");

	self add_option("Weapons", "Assault Rifles", ::submenu, "Assault Rifles", "Assault Rifles");
	self add_option("Weapons", "Submachine Guns", ::submenu, "Submachine Guns", "Submachine Guns");
	self add_option("Weapons", "Light Machine Guns", ::submenu, "Light Machine Guns", "Light Machine Guns");
	self add_option("Weapons", "Shotguns", ::submenu, "Shotguns", "Shotguns");
	self add_option("Weapons", "Snipers", ::submenu, "Snipers", "Snipers");
	self add_option("Weapons", "Specials", ::submenu, "Specials", "Specials");
	self add_option("Weapons", "^5--> Secondary Guns", ::submenu, "Secondary Guns", "Secondary Guns");
	self add_menu("Assault Rifles", "Weapons", "Co-Host");
	self add_menu("Submachine Guns", "Weapons", "Co-Host");
	self add_menu("Light Machine Guns", "Weapons", "Co-Host");
	self add_menu("Shotguns", "Weapons", "Co-Host");
	self add_menu("Snipers", "Weapons", "Co-Host");
	self add_menu("Specials", "Weapons", "Co-Host");
	self add_menu("Secondary Guns", "Weapons", "Co-Host");

	self add_option("Assault Rifles", "MTAR");
	self add_option("Assault Rifles", "Type 25");
	self add_option("Assault Rifles", "Swat-556");
	self add_option("Assault Rifles", "FAL-OSW");
	self add_option("Assault Rifles", "M27");
	self add_option("Assault Rifles", "Scar-H");
	self add_option("Assault Rifles", "SMR");
	self add_option("Assault Rifles", "M8A1");
	self add_option("Assault Rifles", "AN-94");
	self add_option("Submachine Guns", "MP7");
	self add_option("Submachine Guns", "PDW-57");
	self add_option("Submachine Guns", "Vector K10");
	self add_option("Submachine Guns", "MSMC");
	self add_option("Submachine Guns", "Chicom CQB");
	self add_option("Submachine Guns", "Skorpion EVO");
	self add_option("Submachine Guns", "Peacekeeper");
	self add_option("Light Machine Guns", "MK 48");
	self add_option("Light Machine Guns", "QBB LSW");
	self add_option("Light Machine Guns", "LSAT");
	self add_option("Light Machine Guns", "HAMR");
	self add_option("Shotguns", "R870 MCS");
	self add_option("Shotguns", "S12");
	self add_option("Shotguns", "KSG");
	self add_option("Shotguns", "M1216");
	self add_option("Snipers", "Ballista");
	self add_option("Snipers", "DSR-50");
	self add_option("Snipers", "XPR");
	self add_option("Snipers", "SVU");
	self add_option("Specials", "Assault Shield");
	
	self add_option("Secondary Guns", "Pistols", ::submenu, "Pistols", "Pistols");
	self add_option("Secondary Guns", "Launchers", ::submenu, "Launchers", "Launchers");
	self add_option("Secondary Guns", "Special", ::submenu, "Special", "Special");
	self add_menu("Pistols", "Secondary Guns", "Co-Host");
	self add_menu("Launchers", "Secondary Guns", "Co-Host");
	self add_menu("Special", "Secondary Guns", "Co-Host");


	self add_option("Pistols", "Five Seven");
	self add_option("Pistols", "Tac-45");
	self add_option("Pistols", "B23R");
	self add_option("Pistols", "Executioner");
	self add_option("Pistols", "KAP-40");
	self add_option("Launchers", "SMAW");
	self add_option("Launchers", "FHJ-18 AA");
	self add_option("Launchers", "RPG");
	self add_option("Special", "Crossbow");
	self add_option("Special", "Ballistic Knife");

	//camos
	
	self add_option(self.menuname, "Camos", ::submenu, "Camos", "Camos");
	self add_menu("Camos", self.menuname, "Co-Host");

	self add_option("Camos", "Default Camos", ::submenu, "Default Camos", "Default Camos");
	self add_option("Camos", "DLC #^51^7 Camos", ::submenu, "DLC Camos", "DLC Camos");
	self add_option("Camos", "DLC #^52^7 Camos", ::submenu, "DLC Camos2", "DLC Camos");
	self add_option("Camos", "^1S^2p^3e^4c^5i^6a^1l^2s^7 Camos", ::submenu, "Special Camos", "Special Camos");
	self add_menu("Default Camos", "Camos", "Co-Host");
	self add_menu("DLC Camos", "Camos", "Co-Host");
	self add_menu("DLC Camos2", "Camos", "Co-Host");
	self add_menu("Special Camos", "Camos", "Co-Host");

	self add_option("Default Camos", "No Camo");
	self add_option("Default Camos", "DEVGRU");
	self add_option("Default Camos", "A-TACS AU");
	self add_option("Default Camos", "ERDL");
	self add_option("Default Camos", "Siberia");
	self add_option("Default Camos", "Choco");
	self add_option("Default Camos", "Blue Tiger");
	self add_option("Default Camos", "Bloodshot");
	self add_option("Default Camos", "Ghostex: Delta 6");
	self add_option("Default Camos", "Krpytek: Typhon");
	self add_option("Default Camos", "Carbon Fiber");
	self add_option("Default Camos", "Cherry Blossom");
	self add_option("Default Camos", "Art Of War");
	self add_option("Default Camos", "^5--> Page 2^7", ::submenu, "Default CamosP2", "Default Camos");
	self add_menu("Default CamosP2", "Default Camos", "Co-Host");
	self add_option("Default CamosP2", "Ronin");
	self add_option("Default CamosP2", "Skulls");
	self add_option("Default CamosP2", "Gold");
	self add_option("Default CamosP2", "Diamond");

	self add_option("DLC Camos", "Jungle");
	self add_option("DLC Camos", "Money");
	self add_option("DLC Camos", "Dia De Muertos");
	self add_option("DLC Camos", "Graffiti");
	self add_option("DLC Camos", "Kawaii");
	self add_option("DLC Camos", "Party Rock");
	self add_option("DLC Camos", "Zombies");
	self add_option("DLC Camos", "Viper");
	self add_option("DLC Camos", "Bacon");
	self add_option("DLC Camos", "Cyborg");
	self add_option("DLC Camos", "Dragon");
	self add_option("DLC Camos", "Aqua");
	self add_option("DLC CamosP2", "^5--> Page 2", ::submenu, "DLC CamosP2", "DLC Camos");
	self add_menu("DLC CamosP2", "DLC Camos", "Co-Host");
	self add_option("DLC CamosP2", "Breach");
	self add_option("DLC CamosP2", "Coyote");
	self add_option("DLC CamosP2", "Glam");
	self add_option("DLC CamosP2", "Rogue");
	self add_option("DLC CamosP2", "Pack-a-Punch");

	self add_option("DLC Camos2", "Punk");
	self add_option("DLC Camos2", "Paladin");
	self add_option("DLC Camos2", "Comics");
	self add_option("DLC Camos2", "Afterlife");
	self add_option("DLC Camos2", "Dead Man's Hand");
	self add_option("DLC Camos2", "Beast");
	self add_option("DLC Camos2", "Octane");
	self add_option("DLC Camos2", "Weaponized 115");

	self add_option("Special Camos", "Ghosts");
	self add_option("Special Camos", "Advanced Warefare");
	self add_option("Special Camos", "Elite");
	self add_option("Special Camos", "CE Digital");
	self add_option("Special Camos", "Disco Camo");

	//build menu

	self add_option(self.menuname, "Build Menu", ::submenu, "Build Menu", "Build Menu");
	self add_menu("Build Menu", self.menuname, "Co-Host");

	self add_option("Build Menu", "Normal Bounce");
	self add_option("Build Menu", "Stealth Bounce");
	self add_option("Build Menu", "Normal Slide @ Crosshair");
	self add_option("Build Menu", "High Slide @ Crosshair");
	self add_option("Build Menu", "Trickshot Steps");
	self add_option("Build Menu", "Trickshot Platform");
	self add_option("Build Menu", "Teleport Shot");

	//messages

	self add_option(self.menuname, "Messages", ::submenu, "Messages", "Messages");
	self add_menu("Messages", self.menuname, "Co-Host");

	self add_option("Messages", "Welcome");
	self add_option("Messages", "Creator");
	self add_option("Messages", "What Menu?");
	self add_option("Messages", "No");
	self add_option("Messages", "Yes");
	self add_option("Messages", "Maybe");
	self add_option("Messages", "Trickshot Last");
	self add_option("Messages", "G.T.F.O");
	self add_option("Messages", "Mad?");
	self add_option("Messages", "Fake Modder");
	self add_option("Messages", "Warning Squeaker");
	self add_option("Messages", "^5--> Page 2^7", ::submenu, "Messages2", "Messages");
	self add_menu("Messages2", "Messages", "Co-Host");
	self add_option("Messages2", "^5--> Advertisments^7", ::submenu, "Advertisments", "Advertisments");
	self add_menu("Advertisments", "Messages2", "Co-Host");
	self add_option("Messages2", "Big Man");
	self add_option("Messages2", "Leave");
	self add_option("Messages2", "Dont Know");
	self add_option("Messages2", "Modding");
	self add_option("Messages2", "Derank");
	self add_option("Messages2", "HAHA");
	self add_option("Messages2", "Shit Kid");
	self add_option("Messages2", "Pornhub Account {Fake}");
	self add_option("Advertisments", "Patch Advert ^6<3");
	self add_option("Advertisments", "^7L|MT");
	self add_option("Advertisments", "B|MT");
	self add_option("Advertisments", "Heart Host");
	self add_option("Advertisments", "^5How To Open Menu");

	//fun menu

	self add_option(self.menuname, "Fun Menu", ::submenu, "Fun Menu", "Fun Menu");
	self add_menu("Fun Menu", self.menuname, "Co-Host");

	self add_option("Fun Menu", "Rapid fire");
	self add_option("Fun Menu", "Auto Dropshot");
	self add_option("Fun Menu", "Forge Mode");
	self add_option("Fun Menu", "Advanced Forge Mode");
	self add_option("Fun Menu", "Spin Yourself");
	self add_option("Fun Menu", "Jet Pack");
	self add_option("Fun Menu", "Multi Jump");
	self add_option("Fun Menu", "T-Bag");
	self add_option("Fun Menu", "360 Prone");
	self add_option("Fun Menu", "360 Ladder");
	self add_option("Fun Menu", "Visions");
	self add_option("Fun Menu", "Fake Death");
	self add_option("Fun Menu", "Hulk V2");
	self add_option("Fun Menu", "^5--> Page 2^7", ::submenu, "Fun Menu2", "Messages");
	self add_menu("Fun Menu2", "Fun Menu", "Co-Host");
	self add_option("Fun Menu2", "Change Sky Color");
	self add_option("Fun Menu2", "Leap Frog");
	self add_option("Fun Menu2", "Spec Nade");
	self add_option("Fun Menu2", "Rotar Head");

	//menu settings

	self add_option(self.menuname, "Menu Settings", ::submenu, "Menu Settings", "Menu Settings");
	self add_menu("Menu Settings", self.menuname, "Co-Host");
	
	self add_option("Menu Settings", "^5--> Themes", ::submenu, "Themes", "Themes");
	self add_menu("Themes", "Menu Settings", "Co-Host");
	self add_option("Menu Settings", "Play Welcome MSG");
	self add_option("Menu Settings", "Toggle Stealth");
	self add_option("Themes", "Cyan");
	self add_option("Themes", "White");
	self add_option("Themes", "Red");
	self add_option("Themes", "Blue");
	self add_option("Themes", "Green");
	self add_option("Themes", "Yellow");
	self add_option("Themes", "Pink");
	self add_option("Themes", "Aqua");
	self add_option("Themes", "Black");
	self add_option("Themes", "Flashing");

	//team menu

	self add_option(self.menuname, "Team Menu", ::submenu, "Team Menu", "Team Menu");
	self add_menu("Team Menu", self.menuname, "Co-Host");
	self add_option("Team Menu", "^5--> Your Team^7", ::submenu, "Your Team", "Your Team");
	self add_option("Team Menu", "^1--> Enemy Team", ::submenu, "Enemy Team", "Enemy Team");
	self add_menu("Your Team", "Team Menu", "Co-Host");
	self add_menu("Enemy Team", "Team Menu", "Co-Host");
	
	self add_option("Your Team", "Godmode");
	self add_option("Your Team", "Unlimited Ammo");
	self add_option("Your Team", "Invisible");
	self add_option("Your Team", "Trickshot Aimbot");
	self add_option("Your Team", "Spin");
	self add_option("Your Team", "Kill");
	self add_option("Your Team", "Revive Team");
	
	self add_option("Enemy Team", "Godmode");
	self add_option("Enemy Team", "Unlimited Ammo");
	self add_option("Enemy Team", "Invisible");
	self add_option("Enemy Team", "Trickshot Aimbot");
	self add_option("Enemy Team", "Spin");
	self add_option("Enemy Team", "Kill");
	self add_option("Enemy Team", "Revive Team");

	//players menu

	self add_option(self.menuname, "Players Menu", ::submenu, "Players Menu", "Players Menu");
	self add_menu("Players Menu", self.menuname, "Co-Host");


	foreach (player in level.players)
	{
		self add_option("Players Menu", "[" + verificationToColor(player.status) + "] " + player.name, ::submenu, player.name, "[" + verificationToColor(player.status) + "] " + player.name);
		self add_menu_alt(player.name, "Players Menu");
		
		if(self.status == "Host" || self.status == "Co-Host") {
			self add_option(player.name, "Give Co-Host " + player.name, ::changeVerificationMenu, player, "Co-Host");
			self add_option(player.name, "^3UnVerify^7" + player.name, ::changeVerificationMenu, player, "Unverified");	
		}
		self add_option(player.name, "Freeze");
		self add_option(player.name, "Unfreeze");	
		self add_option(player.name, "Kick Player");
		self add_option(player.name, "Death Loop");
		self add_option(player.name, "Add 29 Kills");	
		self add_option(player.name, "Him -> Me");	
		self add_option(player.name, "Me -> Him");
		self add_option(player.name, "Revive Player");
		self add_option(player.name, "Give Azza Aimbot");
		self add_option(player.name, "Give Trickshot Aimbot");
		self add_option(player.name, "Give Legit Aimbot");
		
	}

}

updatePlayersMenu()
{
	self.menu.menucount["Players Menu"] = 0;

	self add_menu("All Players Menu", "Players Menu", "Co-Host");

		self add_option("All Players Menu", "Freeze");
		self add_option("All Players Menu", "Unfreeze");	
		self add_option("All Players Menu", "Kick Player");
		self add_option("All Players Menu", "Death Loop");
		self add_option("All Players Menu", "Add 29 Kills");	
		self add_option("All Players Menu", "Him -> Me");	
		self add_option("All Players Menu", "Me -> Him");
		self add_option("All Players Menu", "Revive Player");
		self add_option("All Players Menu", "Give Azza Aimbot");
		self add_option("All Players Menu", "Give Trickshot Aimbot");
		self add_option("All Players Menu", "Give Legit Aimbot");

	foreach (player in level.players)
	{
		playersizefixed = level.players.size - 1;
		if(self.menu.crs["Players Menu"] > playersizefixed)
		{
			self.menu.scrollerpos["Players Menu"] = playersizefixed;
			self.menu.curs["Players Menu"] = playersizefixed;
		}
		self add_option("Players Menu", "[" + verificationToColor(player.status) + "] " + player.name, ::submenu, player.name, "[" + verificationToColor(player.status) + "] " + player.name);
		self add_menu_alt(player.name, "Players Menu");

		if(self.status == "Host" || self.status == "Co-Host") {
			self add_option(player.name, "Give Co-Host " + player.name, ::changeVerificationMenu, player, "Co-Host");
			self add_option(player.name, "^3UnVerify^7" + player.name, ::changeVerificationMenu, player, "Unverified");	
		}
		self add_option(player.name, "Freeze");
		self add_option(player.name, "Unfreeze");	
		self add_option(player.name, "Kick Player");
		self add_option(player.name, "Death Loop");
		self add_option(player.name, "Add 29 Kills");	
		self add_option(player.name, "Him -> Me");	
		self add_option(player.name, "Me -> Him");
		self add_option(player.name, "Revive Player");
		self add_option(player.name, "Give Azza Aimbot");
		self add_option(player.name, "Give Trickshot Aimbot");
		self add_option(player.name, "Give Legit Aimbot");
		
	}
}

add_menu_alt(Menu, prevmenu)
{
	self.menu.getmenu[Menu] = Menu;
	self.menu.menucount[Menu] = 0;
	self.menu.previousmenu[Menu] = prevmenu;
}

add_menu(Menu, prevmenu, status)
{
    self.menu.status[Menu] = status;
	self.menu.getmenu[Menu] = Menu;
	self.menu.scrollerpos[Menu] = 0;
	self.menu.curs[Menu] = 0;
	self.menu.menucount[Menu] = 0;
	self.menu.previousmenu[Menu] = prevmenu;
}

add_option(Menu, Text, Func, arg1, arg2)
{
	Menu = self.menu.getmenu[Menu];
	Num = self.menu.menucount[Menu];
	self.menu.menuopt[Menu][Num] = Text;
	self.menu.menufunc[Menu][Num] = Func;
	self.menu.menuinput[Menu][Num] = arg1;
	self.menu.menuinput1[Menu][Num] = arg2;
	self.menu.menucount[Menu] += 1;
}
updateScrollbar()
{
	self.menu.scroller MoveOverTime(0.05);
	self.menu.scroller.y = 107 + (self.menu.curs[self.menu.currentmenu] * 16.9);
}

openMenu()
{

	self freezecontrols(0);
	self StoreText(self.menuname, self.menuname);
	self.menu.backgroundinfo fadeovertime( 0.3 );
	self.menu.backgroundinfo.alpha = 0;
	self.statuss fadeovertime( 0.3 );
	self.statuss.alpha = 1;
	self.menu.background fadeovertime( 0.3 );
	self.menu.background.alpha = 0.7;
	self.menu.background.archived = self.stealth;
	self.menu.background1 fadeovertime( 0.3 );
	self.menu.background1.alpha = 0;
	self.menu.background1.archived = self.stealth;
	self.menu.background2 fadeovertime( 0.3 );
	self.menu.background2.alpha = 0.3;
	self.menu.background2.archived = self.stealth;
	self.swagtext fadeovertime( 0.3 );
	self.swagtext.alpha = 0.9;
	self.menu.line moveovertime( 0.3 );
	self.menu.line.y = 60;
	self.menu.line.archived = self.stealth;
	self.menu.line2 moveovertime( 0.3 );
	self.menu.line2.y = 60;
	self.menu.line2.archived = self.stealth;
	self.menu.line3 moveovertime( 0.3 );
	self.menu.line3.y = 60;
	self.menu.line3.archived = self.stealth;
	self.menu.line4 moveovertime( 0.32 );
	self.menu.line4.y = 358;
	self.menu.line4.archived = self.stealth;
	self.menu.line5 moveovertime( 0.3 );
	self.menu.line5.y = 170;
	self.menu.line5.archived = self.stealth;
	self.menu.line6 moveovertime( 0.3 );
	self.menu.line6.y = 170;
	self.menu.line6.archived = self.stealth;
	self.menu.line7 moveovertime( 0.3 );
	self.menu.line7.y = 280;
	self.menu.line7.archived = self.stealth;

	self updateScrollbar();
    self.menu.open = true;
}

closeMenu()
{
	self.menu.options fadeovertime( 0.3 );
	self.menu.options.alpha = 0;
	self.hdbro fadeovertime( 0.3 );
	self.hdbro.alpha = 0;
	self.statuss fadeovertime( 0.3 );
	self.statuss.alpha = 0;
	self.menu.background fadeovertime( 0.3 );
	self.menu.background.alpha = 0;
	self.menu.background1 fadeovertime( 0.3 );
	self.menu.background1.alpha = 0;
	self.menu.background2 fadeovertime( 0.3 );
	self.menu.background2.alpha = 0;
	self.menu.title fadeovertime( 0.3 );
	self.menu.title.alpha = 0;
	self.menu.line moveovertime( 0.3 );
	self.menu.line.y = -550;
	self.menu.line2 moveovertime( 0.3 );
	self.menu.line2.y = -550;
	self.menu.line3 moveovertime( 0.3 );
	self.menu.line3.y = -550;
	self.menu.line4 moveovertime( 0.3 );
	self.menu.line4.y = 550;
	self.menu.line5 moveovertime( 0.3 );
	self.menu.line5.y = -550;
	self.menu.line6 moveovertime( 0.3 );
	self.menu.line6.y = -550;
	self.menu.line7 moveovertime( 0.3 );
	self.menu.line7.y = 550;
	self.menu.backgroundinfo fadeovertime( 0.3 );
	self.menu.backgroundinfo.alpha = 0;
	self.menu.scroller moveovertime( 0.3 );
	self.menu.scroller.y = -510;

    self.menu.open = false;

}

destroyMenu(player)
{
    player.MenuInit = false;
	closemenu();
	wait 0.3;
	player.menu.options destroy();
	player.menu.background1 destroy();
	player.menu.scroller destroy();
	player.menu.scroller1 destroy();
	player.infos destroy();
	player.menu.line destroy();
	player.menu.line2 destroy();
	player.menu.title destroy();
	player notify("destroyMenu");
}

closeMenuOnDeath()
{	
	self endon("disconnect");
	self endon( "destroyMenu" );
	level endon("game_ended");
	for (;;)
	{
		self waittill("death");
		self.menu.closeondeath = true;
		self submenu(self.menuname, self.menuname);
		closeMenu();
		self.menu.closeondeath = false;
	}
}

submenu(input, title)
{
	if (verificationToNum(self.status) >= verificationToNum(self.menu.status[input]))
	{
		self.menu.options destroy();

		if (input == self.menuname)
			self thread StoreText(input, self.menuname);
		else if (input == "Players Menu")
		{
			self updatePlayersMenu();
			self thread StoreText(input, "Players Menu");
		}
		else
			self thread StoreText(input, title);
			
		self.CurMenu = input;
		
		self.menu.scrollerpos[self.CurMenu] = self.menu.curs[self.CurMenu];
		self.menu.curs[input] = self.menu.scrollerpos[input];
		
		if (!self.menu.closeondeath)
		{
			self updateScrollbar();
   		}
    }
    else
    {
		self iPrintln("You ^1don't ^7have enough permissions [" + verificationToColor(self.menu.status[input]) + "]");
    }
}


