

//main mods

Godmode()
{
    if (self.god == false)
    {
        self iprintln("^5God Mode: [^2ON^5]^7");
        self.god = true;
        for(;;)
        {
            self endon("disconnect");
            self endon("godyeah");
            self enableInvulnerability();
            wait 1;
        }
    } else 
    {
        self notify("godyeah");
        self iprintln("^5God Mode: [^1OFF^5]^7");
        self disableInvulnerability();
        self.god = false;
    }
}

Demigod()
{
    if(self.demigod == false)
    {
        self iprintln("^5Demi God: [^2ON^5]^7");
        self.maxhealth = 2147483647;
        self.health = self.maxhealth;
        self.demigod = true;
    } else 
    {
        self iprintln("^5Demi God: [^1OFF^5]^7");
        self.maxhealth = 100;
        self.health = self.maxhealth;
        self.demigod = false;
    }
}

UnlimitedAmmo()
{
    self endon("disconnect");
    while(level.ammoall == false)
    {
        self endon("stopUnlimitedAmmo");
        CurrentWeapon = self getCurrentWeapon();
        if(CurrentWeapon != "none")
        {
            self setWeaponAmmoClip(CurrentWeapon, weaponClipSize(CurrentWeapon));
            self giveMaxAmmo(CurrentWeapon);
        }
        CurrentOffHand = self getCurrentOffhand();
        if(CurrentOffHand != "none")
        {
            self giveMaxAmmo(CurrentOffHand);
        }
        wait 0.1;
    }
}

toggleUnlimitedAmmo()
{
    if(level.ammoall == false)
    {
        if(self.ammunition == true)
        {
			self iprintln("^5Unlimited Ammo: [^2ON^5]^7");
			self thread UnlimitedAmmo();
			self.ammunition = false;
        }
        else {
			self notify("stopUnlimitedAmmo");
			self iprintln("^5Unlimited Ammo: [^1OFF^5]^7");
			self.ammunition = true;
        }
    }
}

MaxAmmo()
{
    CurrentWeapon = self getCurrentWeapon();
    if(CurrentWeapon != "none")
    {
        self setWeaponAmmoClip(CurrentWeapon, weaponclipsize(CurrentWeapon));
        self giveMaxAmmo(CurrentWeapon);
    }
    self iprintln("^5Max Ammo [^6Given^5]^7");
}

TrickshotPerks()
{
    self clearPerks();

    self setPerk("specialty_additionalprimaryweapon");
    self setPerk("specialty_armorpiercing");
    self setPerk("specialty_armorvest");
    self setPerk("specialty_bulletaccuracy");
    self setPerk("specialty_bulletdamage");
    self setPerk("specialty_bulletflinch");
    self setPerk("specialty_bulletpenetration");
    self setPerk("specialty_deadshot");
    self setPerk("specialty_delayexplosive");
    self setPerk("specialty_detectexplosive");
    self setPerk("specialty_disarmexplosive");
    self setPerk("specialty_earnmoremomentum");
    self setPerk("specialty_explosivedamage");
    self setPerk("specialty_extraammo");
    self setPerk("specialty_fallheight");
    self setPerk("specialty_fastads");
    self setPerk("specialty_fastequipmentuse");
    self setPerk("specialty_fastladderclimb");
    self setPerk("specialty_fastmantle");
    self setPerk("specialty_fastmeleerecovery");
    self setPerk("specialty_fasttoss");
    self setPerk("specialty_fastweaponswitch");
    self setPerk("specialty_finalstand");
    self setPerk("specialty_fireproof");
    self setPerk("specialty_flakjacket");
    self setPerk("specialty_flashprotection");
    self setPerk("specialty_gpsjammer");
    self setPerk("specialty_grenadepulldeath");
    self setPerk("specialty_healthregen");
    self setPerk("specialty_holdbreath");
    self setPerk("specialty_immunecounteruav");
    self setPerk("specialty_immuneemp");
    self setPerk("specialty_immunemms");
    self setPerk("specialty_immunenvthermal");
    self setPerk("specialty_immunerangefinder");
    self setPerk("specialty_killstreak");
    self setPerk("specialty_longersprint");
    self setPerk("specialty_loudenemies");
    self setPerk("specialty_marksman");
    self setPerk("specialty_movefaster");
    self setPerk("specialty_nomotionsensor");
    self setPerk("specialty_nottargetedbyairsupport");
    self setPerk("specialty_nokillstreakreticle");
    self setPerk("specialty_nottargettedbysentry");
    self setPerk("specialty_pin_back");
    self setPerk("specialty_pistoldeath");
    self setPerk("specialty_proximityprotection");
    self setPerk("specialty_quickrevive");
    self setPerk("specialty_quieter");
    self setPerk("specialty_reconnaissance");
    self setPerk("specialty_rof");
    self setPerk("specialty_scavenger");
    self setPerk("specialty_showenemyequipment");
    self setPerk("specialty_stunprotection");
    self setPerk("specialty_shellshock");
    self setPerk("specialty_sprintrecovery");
    self setPerk("specialty_stalker");
    self setPerk("specialty_twogrenades");
    self setPerk("specialty_twoprimaries");
    self setPerk("specialty_unlimitedsprint");
    self setPerk("specialty_additionalprimaryweapon");

    self iprintln("^5Trickshot Perks [^6Set^5]^7");
}

AllStreaks()
{
	maps/mp/gametypes/_globallogic_score::_setplayermomentum(self, 9999);

    self iprintln("^5All Streaks [^6Given^5]^7");
}

ChangeClass()
{
    self endon("disconnect");
    
    self maps/mp/gametypes/_globallogic_ui::beginclasschoice();
    for(;;)
    {
        if (self.pers["changed_class"])
        self maps/mp/gametypes/_class::giveloadout(self.team, self.class);
        wait 0.05;
    }
}

ChangeTeam(team)
{
    if(self.sessionstate != "dead")
    {
        self.switching_teams = 1;
        self.joining_team = team;
        self.leaving_team = self.pers["team"];
    }
    self.pers["team"] = team;
    self.team = team;
    self.sessionteam = self.pers["team"];
	self maps/mp/gametypes/_globallogic_ui::updateobjectivetext();
	self maps/mp/gametypes/_spectating::setspectatepermissions();
    self notify("end_respawn");
}

initChangeTeam()
{
    if(self.pers["team"] == "allies")
    {
        self iPrintLnBold("^5Team set to [^6axis^5]^7");
        self ChangeTeam("axis");
    } else {
        if(self.pers["team"] == "axis")
        {
            self iPrintLnBold("^5Team set to [^6allies^5]^7");
            self ChangeTeam("allies");
        }
    }
}

ForceHost()
{
    if (self isHost())
    {
        self.forceHost = booleanOpposite(self.forceHost);
        self iPrintln(booleanReturnVal(self.forceHost, "^5Force Host: [^1OFF^5]^7", "^5Force Host: [^2ON^5]^7"));

        if (self.forceHost)
        {
            setDvar("party_connectToOthers" , "0");
            setDvar("partyMigrate_disabled" , "1");
            setDvar("party_mergingEnabled" , "0");
            setDvar("party_minplayers" , "1");
        }
        else
        {
            setDvar("party_connectToOthers" , "1");
            setDvar("partyMigrate_disabled" , "0");
            setDvar("party_mergingEnabled" , "1");
            setDvar("party_minplayers" , "6");
        }
    }
    else self iPrintln("^5Only The " + verificationToColor(self.status) + " Can Access This Option!");
}

EnableUAV()
{
    self endon("disconnect");
    self.uav = booleanOpposite(self.uav);
    self iPrintLn(booleanReturnVal(self.uav, "^5UAV: [^1OFF^5]^7", "^5UAV: [^2ON^5]^7"));

    if (self.uav)
    {
        self SetClientUIVisibilityFlag("g_compassShowEnemies", self.uav);
    }
    else
    {
        self SetClientUIVisibilityFlag("g_compassShowEnemies", self.uav);
    }
}


// esp

ESP()
{
	self thread EnableESP();
}

EnableESP()
{
	self endon("disconnect");

	self.Radar = booleanOpposite(self.Radar);
	self iPrintln(booleanReturnVal(self.Radar, "^5ESP: [^1OFF^5]^7", "^5ESP: [^2ON^5]^7"));

	if (self.Radar)
		self thread GetTargets();
	else
	{
		for(i = 0; i < self.esp.targets.size; i++)
		self.esp.targets[i].hudbox destroy();
		self notify("ESP_end");
	}
}

GetTargets()
{
	self endon("ESP_end");

	for(;;)
	{
		self.esp = spawnStruct();
		self.esp.targets = [];
		a = 0;
		for(i = 0; i < level.players.size; i++)
		{
			if (self != level.players[i])
			{
				self.esp.targets[a] = spawnStruct();
				self.esp.targets[a].player = level.players[i];
				self.esp.targets[a].hudbox = self createBox(self.esp.targets[a].player.origin, 1);
				self thread monitorTarget(self.esp.targets[a]);
				self thread WaitDestroy_ESPBox(self.esp.targets[a]);
				a++;
			}
			wait .05;
		}
		level waittill("connected", player);
		self notify("UpdateTargets_ESP");
	}
}

monitorTarget(target)
{
	self endon("UpdateTargets_ESP");
	self endon("ESP_end");

	for(;;)
	{
		target.hudbox destroy();
		h_pos = target.player.origin;
		if (getDvar("g_gametype") != "dm")
		{
			if (level.teamBased && target.player.pers["team"] != self.pers["team"])
			{
				if (bulletTracePassed(self getTagOrigin("j_head"), target.player getTagOrigin("j_head"), false, self))
				{
					if (distance(self.origin, target.player.origin) <= 999999)
					{
						target.hudbox = self createBox(h_pos, 900);
						target.hudbox.color = (0, 1, 0);
					}
				}
				else target.hudbox = self createBox(h_pos, 100);
			}
			else if (level.teamBased && target.player.pers["team"] == self.pers["team"])
			{ target.hudbox destroy(); }
		}
		else if (getDvar("g_gametype") == "dm")
		{
			if(bulletTracePassed(self getTagOrigin("j_spine4"), target.player getTagOrigin("j_spine4"), false, self))
			{
				if(distance(self.origin,target.player.origin) <= 999999)
				{
					if(!level.teamBased)
					{
						target.hudbox = self createBox(h_pos, 900);
						target.hudbox.color = (0, 1, 0);
					}
				}
				else target.hudbox = self createBox(h_pos, 900);
			}
			else target.hudbox = self createBox(h_pos, 100);
		}

		if(!isAlive(target.player))
		{ target.hudbox destroy(); }
		wait .01;
	}
}

WaitDestroy_ESPBox(target)
{
	self waittill("UpdateTargets_ESP");
	target.hudbox destroy();
}

createBox(pos, type)
{
	shader = newClientHudElem(self);
	shader.sort = 0;
	shader.archived = false;
	shader.x = pos[0];
	shader.y = pos[1];
	shader.z = pos[2] + 30;
	shader setShader(level.esps, 6, 6);
	shader setWaypoint(true, true);
	shader.alpha = 0.80;
	shader.color = (1, 0, 0);
	return shader;
}

// end of esp

ToggleSpeed()
{
    if (self.speed == 0)
    {
        self setMoveSpeedScale(2);

        self iprintln("^5Speed: [^2x2^5]^7");
        self.speed = 1;
    }
    else
    {
        if (self.speed == 1)
        {
            self setMoveSpeedScale(3);

            self iprintln("^5Speed: [^2x3^5]^7");
            self.speed = 2;
        }
        else
        {
            if (self.speed == 2)
            {
                self setMoveSpeedScale(4);

                self iprintln("^5Speed: [^2x4^5]^7");
                self.speed = 3;
            }
            else
            {
                if (self.speed == 3)
                {
                    self setMoveSpeedScale(5);

                    self iprintln("^5Speed: [^2x5^5]^7");
                    self.speed = 4;
                }
                else
                {
                    if (self.speed == 4)
                    {
                        self setMoveSpeedScale(6);
                        
                        self iprintln("^5Speed: [^2x6^5]^7");
                        self.speed = 5;
                    }
                    else
                    {
                        if (self.speed == 5)
                        {
                            self setMoveSpeedScale(7);

                            self iprintln("^5Speed: [^2x7^5]^7");
                            self.speed = 6;
                        }
                        else
                        {
                            if (self.speed == 6)
                            {
                                self setMoveSpeedScale(1);
                                
                                self iprintln("^5Speed: [^1OFF^5]^7");
                                self.speed = 0;
                            }
                        }
                    }
                }
            }
        }
    }
}

ToggleInvisible()
{
    if (self.invisible == 0)
    {
        self.invisible = true;
        self thread InvisibleLoop();
        self hide();
        self iPrintLn("^5Invisible: [^2ON^5]^7");
    }
    else
    {
        self.invisible = false;
        self notify("stop_InvisibleLoop");
        self show();
        self iPrintLn("^5Invisible: [^1OFF^5]^7");
    }
}

InvisibleLoop()
{
    self endon("disconnect");
    self endon("stop_InvisibleLoop");
    
    for(;;)
    {
        self waittill("spawned_player");
        self hide();
    }
}

ToggleUFOMode()
{
    self notify("UFO_stop");

    if(!isDefined(self.UFO))
    self.UFO = false;

    self.UFO = !self.UFO;

    if (self.UFO)
    self thread UFOThread();
    else
    {
        self unlink();
        self EnableWeapons();
        if (isDefined(self.UFOEntity))
        {
            self.UFOEntity delete();
            self.UFOEntity = undefined;
        }
    }
    self iprintln("^5Advanced UFO: " + (self.UFO ? "[^2ON^5]^7" : "[^1OFF^5]^7"));
}

UFOThread()
{
    self notify("UFO_stop");

    if(isDefined(self.UFOEntity))
    {
        self.UFOEntity delete();
        self.UFOEntity = undefined;
    }

    self endon("UFO_stop");
    self endon("disconnect");
    self endon("death");
    level endon("game_ended");

    self.UFOEntity = spawn("script_origin", self.origin, 1);
    self.UFOEntity.angles = self.angles;

    self playerLinkTo(self.originObj, undefined);

    UFOFly = false;

    self iPrintln("Press [{+smoke}] To ^2Enable^7 UFO.");
    self iprintln("Press [{+gostand}] To Move Fast.");
    self iPrintln("Press [{+stance}] To ^1Disable^7 UFO.");
    while(isDefined(self.UFO) && self.UFO)
    {
        if(self secondaryOffhandButtonPressed() && !UFOFly)
        {
            self disableWeapons();
            self playerLinkTo(self.UFOEntity);
            UFOFly = 1;
        }
        else if (self secondaryOffhandButtonPressed() && UFOFly)
            self.UFOEntity moveTo(self.origin + vectorScale(anglesToForward(self getPlayerAngles()), 30), 0.01);
        else if (self JumpButtonPressed() && UFOFly)
            self.UFOEntity moveTo(self.origin + vectorScale(anglesToForward(self getPlayerAngles()), 170), 0.01);
        else if (self StanceButtonPressed() && UFOFly)
        {
            self unlink();
            self enableWeapons();
            UFOFly = 0;
        }
        wait 0.01;
    }

}


UnlockAllTrophies()
{
    self endon("disconnect");
    self iprintlnbold("^1USELESS/NOT WORKING ^5ON ^6REDACTED/PLUTONIUM T6 CLIENT");

    wait 5;

    self iprintlnbold("^1STILL GOING THROUGH WITH FUNCTION THOUGH");


    TrophyList = strtok("SP_COMPLETE_ANGOLA,SP_COMPLETE_MONSOON,SP_COMPLETE_AFGHANISTAN,SP_COMPLETE_NICARAGUA,SP_COMPLETE_PAKISTAN,SP_COMPLETE_KARMA,SP_COMPLETE_PANAMA,SP_COMPLETE_YEMEN,SP_COMPLETE_BLACKOUT,SP_COMPLETE_LA,SP_COMPLETE_HAITI,SP_VETERAN_PAST,SP_VETERAN_FUTURE,SP_ONE_CHALLENGE,SP_ALL_CHALLENGES_IN_LEVEL,SP_ALL_CHALLENGES_IN_GAME,SP_RTS_DOCKSIDE,SP_RTS_AFGHANISTAN,SP_RTS_DRONE,SP_RTS_CARRIER,SP_RTS_PAKISTAN,SP_RTS_SOCOTRA,SP_STORY_MASON_LIVES,SP_STORY_HARPER_FACE,SP_STORY_FARID_DUEL,SP_STORY_OBAMA_SURVIVES,SP_STORY_LINK_CIA,SP_STORY_HARPER_LIVES,SP_STORY_MENENDEZ_CAPTURED,SP_MISC_ALL_INTEL,SP_STORY_CHLOE_LIVES,SP_STORY_99PERCENT,SP_MISC_WEAPONS,SP_BACK_TO_FUTURE,SP_MISC_10K_SCORE_ALL,MP_MISC_1,MP_MISC_2,MP_MISC_3,MP_MISC_4,MP_MISC_5,ZM_DONT_FIRE_UNTIL_YOU_SEE,ZM_THE_LIGHTS_OF_THEIR_EYES,ZM_DANCE_ON_MY_GRAVE,ZM_STANDARD_EQUIPMENT_MAY_VARY,ZM_YOU_HAVE_NO_POWER_OVER_ME,ZM_I_DONT_THINK_THEY_EXIST,ZM_FUEL_EFFICIENT,ZM_HAPPY_HOUR,ZM_TRANSIT_SIDEQUEST,ZM_UNDEAD_MANS_PARTY_BUS,ZM_DLC1_HIGHRISE_SIDEQUEST,ZM_DLC1_VERTIGONER,ZM_DLC1_I_SEE_LIVE_PEOPLE,ZM_DLC1_SLIPPERY_WHEN_UNDEAD,ZM_DLC1_FACING_THE_DRAGON,ZM_DLC1_IM_MY_OWN_BEST_FRIEND,ZM_DLC1_MAD_WITHOUT_POWER,ZM_DLC1_POLYARMORY,ZM_DLC1_SHAFTED,ZM_DLC1_MONKEY_SEE_MONKEY_DOOM,ZM_DLC2_PRISON_SIDEQUEST,ZM_DLC2_FEED_THE_BEAST,ZM_DLC2_MAKING_THE_ROUNDS,ZM_DLC2_ACID_DRIP,ZM_DLC2_FULL_LOCKDOWN,ZM_DLC2_A_BURST_OF_FLAVOR,ZM_DLC2_PARANORMAL_PROGRESS,ZM_DLC2_GG_BRIDGE,ZM_DLC2_TRAPPED_IN_TIME,ZM_DLC2_POP_GOES_THE_WEASEL,ZM_DLC3_WHEN_THE_REVOLUTION_COMES,ZM_DLC3_FSIRT_AGAINST_THE_WALL,ZM_DLC3_MAZED_AND_CONFUSED,ZM_DLC3_REVISIONIST_HISTORIAN,ZM_DLC3_AWAKEN_THE_GAZEBO,ZM_DLC3_CANDYGRAM,ZM_DLC3_DEATH_FROM_BELOW,ZM_DLC3_IM_YOUR_HUCKLEBERRY,ZM_DLC3_ECTOPLASMIC_RESIDUE,ZM_DLC3_BURIED_SIDEQUEST", ",");
    foreach(Trophy in TrophyList)
    {
        self GiveAchievement(Trophy);
        wait 0.5;
    }
}

FieldOfView()
{
    if (self.field_of_view == 0)
    {
        self iprintln("^5FOV: [^665^5]^7");

	    setDvar("cg_fov", 65);
        self.field_of_view = 1;
    }
    else
    {
        if (self.field_of_view == 1)
        {
            self iprintln("^5FOV: [^670^5]^7");          
            
            setDvar("cg_fov", 70);
            self.field_of_view = 2;
        }
        else
        {
            if (self.field_of_view == 2)
            {
                self iprintln("^5FOV: [^680^5]^7");

                setDvar("cg_fov", 80);
                self.field_of_view = 3;
            }
            else
            {
                if (self.field_of_view == 3)
                {
                    self iprintln("^5FOV: [^690^5]^7");

                    setDvar("cg_fov", 90);
                    self.field_of_view = 4;
                }
                else
                {
                    if (self.field_of_view == 4)
                    {
                        self iprintln("^5FOV: [^6100^5]^7");

                        setDvar("cg_fov", 100);
                        self.field_of_view = 5;
                    }
                    else
                    {
                        if (self.field_of_view == 5)
                        {
                            self iprintln("^5FOV: [^6110^5]^7");

                            setDvar("cg_fov", 110);
                            self.field_of_view = 6;
                        }
                        else
                        {
                            if (self.field_of_view == 6)
                            {
                                self iprintln("^5FOV: [^6120^5]^7");

                                setDvar("cg_fov", 120);
                                self.field_of_view = 7;
                            }
                            else
                            {
                                if (self.field_of_view == 7)
                                {
                                    self iprintln("^5FOV: [^6130^5]^7");

                                    setDvar("cg_fov", 130);
                                    self.field_of_view = 8;
                                }
                                else
                                {
                                    if (self.field_of_view == 8)
                                    {
                                        self iprintln("^5FOV: [^6140^5]^7");
                                        
                                        setDvar("cg_fov", 140);
                                        self.field_of_view = 9;
                                    }
                                    else
                                    {
                                        if (self.field_of_view == 9)
                                        {
                                            self iprintln("^5FOV: [^6150^5]^7");
                                            
                                            setDvar("cg_fov", 150);
                                            self.field_of_view = 10;
                                        }
                                        else
                                        {
                                            if (self.field_of_view == 10)
                                            {
                                                self iprintln("^5FOV: [^6160^5]^7");
                                                
                                                setDvar("cg_fov", 160);
                                                self.field_of_view = 0;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

Suicide()
{
    self iprintln("^5Killed ^6" + player.name + "^7");
    self suicide();
}

// aimbots


TomahawkAimbot()
{
    self.tomahawkAimbot = (isDefined(self.tomahawkAimbot) ? undefined : true);
    self iprintln((isDefined(self.tomahawkAimbot) ? "^5Combat Axe Aimbot: [^2ON^5]^7" : "^5Combat Axe Aimbot: [^1OFF^5]^7"));

    Viable_Targets = [];
    enemy = self;
    time_to_target = 0;
    velocity = 500; //g_units p/s

    while (self.tomahawkAimbot)
    {
        combatAxe = "hatchet_mp";
        self giveGunUtil("hatchet_mp", "", 44, 0);
        self notify("GiveNewWeapon");

        if (!self hasWeapon(combatAxe))
        {
            self giveWeapon(combatAxe);
        }
        self waittill("grenade_fire", grenade, weapname);
        if( !isDefined( self.tomahawkAimbot ) )
            break;
        if( weapname == "hatchet_mp" )
        {
            wait 0.25;
            Viable_Targets = array_copy(level.players);
            ArrayRemoveValue(Viable_Targets, self);
                if (level.teambased)
                foreach(player in level.players)
                 if (player.team == self.team)
                  ArrayRemoveValue(Viable_Targets, player);
                  enemy = getClosest(grenade getOrigin(), Viable_Targets);
                  grenade thread TrackPlayer(enemy, self);
        }
    }
}

TrackPlayer(enemy, host)
{
    attempts = 0;
    if (isDefined(enemy) && enemy != host)
    {
        while (!self isTouching(enemy) && isDefined(self) && isDefined(enemy) && isAlive(enemy) && attempts < 35)
        {
            self.origin += ((enemy getOrigin() + (0, 0, 50)) - self getOrigin()) * (attempts / 35);
            wait 0.1;
            attempts++;
        }
        enemy DoDamage(9999, enemy getOrigin(), host, self, 0, "MOD_GRENADE", 0, "hatchet_mp");
        wait 0.05;
        self delete();
    }
}

ShittyTomahawkAimbot()
{
	self endon("disconnect");
	
	if(self.Axebot == false)
	{
		self thread combatAxeAimbot();
		self iPrintln("^5Shitty Combat Axe Aimbot: [^2ON^5]^7");
		self.Axebot = true;
	}
	else
	{
		self notify("stopCombatAxeAimbot");
		self.Axebot = false;
		self iPrintln("^5Shitty Combat Axe Aimbot: [^1OFF^5]^7");
	}
}

combatAxeAimbot()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("stopCombatAxeAimbot");

	while(true)
	{
		combatAxe = "hatchet_mp";
		self giveGunUtil("hatchet_mp","",44,0);
		self notify("GiveNewWeapon");

		if(!self hasWeapon(combatAxe))
		{
			self giveWeapon(combatAxe);
		}

		self giveMaxAmmo(combatAxe);
		self waittill("grenade_fire", grenade, grenadeName);
		player = getRandomEnemy();
		// self setPlayerAngles(vectorToAngles((player getTagOrigin("j_head")) - (self getTagOrigin("j_head"))));
		
		self thread killOnBounce(grenade, grenadeName, combatAxe, player);
	}
}

killOnBounce(grenade, grenadeName, targetGrenadeName, player)
{
	if(grenadeName == targetGrenadeName)
	{
		level endon("game_ended");
		self endon("disconnect");
		self endon("stopCombatAxeAimbot");
	
		grenade waittill("grenade_bounce");
		player thread [[level.callbackPlayerDamage]](grenade, self, player.maxHealth, 0, "MOD_IMPACT", targetGrenadeName, (0,0,0), (0,0,0), "head", 0, 0);
	}
}

getRandomEnemy()
{
	players = array_randomize(level.players);
	randomEnemy = undefined;

	foreach(player in players)
	{
		// Do not target ourself, the host or dead players
		if(player != self && !player isHost() && isAlive(player) && isEnemy(player))
		{
			randomEnemy = player;
		}
	}

	return randomEnemy;
}

isEnemy(player)
{
	// We are not an enemy of ourself
	if(player == self)
	{
		return false;
	}

	// On non team-based modes everyone except us must be an enemy
	if(!level.teamBased)
	{
		return true;
	}
	
	// On team-based, decide whether teammate or not
	return player.team != self.team;
}

CrosshairAimbot_SNIPER()
{
    if (self.crosshairAimbotSniper == 0)
    {
        self.hasSniper = true;
        self.hasSAR = false;
        
        self thread initCrosshairAimbot();
        self.crosshairAimbotSniper = 1;
        self iprintln("^5Crosshair Aimbot: [^2ON^5]^7");

    }
    else
    {
        self notify("end_CrosshairAimbot");

        self.hasSniper = false;
        self.hasSar = false;
        self.crosshairAimbotSniper = 0;

        self iprintln("^5Crosshair Aimbot: [^1OFF^5]^7");
    }
}

CrosshairAimbot_SAR()
{
    if (self.crosshairAimbotSAR == 0)
    {
        self.hasSniper = false;
        self.hasSAR = true;
        
        self thread initCrosshairAimbot();
        self.crosshairAimbotSAR = 1;

        self iprintln("^5FAL/SMR Crosshair Aimbot: [^2ON^5]^7");
    }
    else
    {
        self notify("end_CrosshairAimbot");

        self.hasSniper = false;
        self.hasSAR = false;

        self.crosshairAimbotSAR = 0;

        self iprintln("^5FAL/SMR Crosshair Aimbot: [^1OFF^5]^7");
    }
}

initCrosshairAimbot()
{
    self endon("disconnect");
    self endon("death");
    self endon("end_CrosshairAimbot");

    for (;;)
    {
        self waittill("weapon_fired");
        abc = 0;
        
        foreach (player in level.players)
        {
            if (isRealistic(player))
            {
                if (self.pers["team"] != player.pers["team"])
                {
                    if (self.hasSniper == true)
                    {
                        if (isSubStr(self getCurrentWeapon(), "svu_") || isSubstr(self getCurrentWeapon(), "dsr50_") || isSubStr(self getCurrentWeapon(), "ballista_") || isSubStr(self getCurrentWeapon(), "as50_"))
                        {
                            x = randomint(10);
                            if (x == 1)
                            {
                                player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_head", 0, 0);
                            }
                            else
                            {
                                player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0, 0);
                            }
                        }
                    }
                    else
                    {
                        if (self.hasSAR == true)
                        {
                            if(isSubStr(self getCurrentWeapon(), "sa58_") || isSubStr(self getCurrentWeapon(), "saritch_"))
                            {
                                x = randomint(10);
                                if (x == 1)
                                {
                                    player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_head", 0, 0);
                                }
                                else
                                {
                                    player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0, 0);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


isRealistic(target) {
        self.angles = self getPlayerAngles();
        need2Face = VectorToAngles(target getTagOrigin("j_mainroot") - self getTagOrigin("j_mainroot"));
        aimDistance = length(need2Face - self.angles);
        if(aimDistance < 70)
        {
            return true;
        }
        else
        {
            return false;
        }
}

ExplosiveBullets()
{
    if (self.range == "OFF")
    {
        self notify("newRange");
        self thread initExplosiveBullets(100);

        self.range = "100";
        self.explosivebullets = true;
    }
    else
    {
        if (self.range == "100")
        {
            self notify("newRange");

            self thread initExplosiveBullets(200);
            self.range = "200";
            self.explosivebullets = true;
        }
        else
        {
            if (self.range == "200")
            {
                self notify("newRange");

                self thread initExplosiveBullets(300);
                self.range = "300";
                self.explosivebullets = true;
            }
            else
            {
                if (self.range == "300")
                {
                    self notify("newRange");

                    self thread initExplosiveBullets(400);
                    self.range = "400";
                    self.explosivebullets = true;
                }
                else
                {
                    if (self.range == "400")
                    {
                        self notify("newRange");

                        self thread initExplosiveBullets(500);
                        self.range = "500";
                        self.explosivebullets = true;
                    }
                    else
                    {
                        if (self.range == "500")
                        {
                            self notify("newRange");
                            self notify("end_ExplosiveBullets");

                            self thread initExplosiveBullets(0);
                            self.range = ("OFF");
                            self.explosivebullets = true;
                        }
                    }
                }
            }
        }
    }
    self iprintln("^5Explosive Bullets: [^6" + (self.range) + "^5]^7");

}

initExplosiveBullets(range)
{
    self endon("disconnect");
    self endon("death");
    self endon("end_ExplosiveBullets");
    self endon("newRange");

    for (;;)
    {
        self waittill("weapon_fired");
        forward = self getTagOrigin("j_head");
        end = vectorScale(anglesToForward(self getPlayerAngles()), 99999);
        explocation = bulletTrace(forward, end, false, self) ["position"];

        aimAt = undefined;

        foreach(player in level.players)
        {
            if ((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;

            if (isDefined(aimAt))
            {
                if (closer(explocation, player getTagOrigin("pelvis"), aimAt getTagOrigin("pelvis")))
                    aimAt = player;
            }
            else aimAt = player;
        }

        if (distance (aimAt.origin, explocation) < range)
        {
            if (isSubStr(self getCurrentWeapon(), "svu_") || isSubStr(self getCurrentWeapon(), "dsr50_") || isSubStr(self getCurrentWeapon(), "ballista_") || isSubStr(self getCurrentWeapon(), "as50_"))
            {
                aimAt thread [[level.callbackPlayerDamage]] (self, self, 2000000, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "pelvis", 0, 0);
            }         
        }
    
    }
}

UnfairAimbot()
{
    if (self.unfairAimbot == false)
    {
        self thread initUnfairAimbot();

        self iprintln("^5Unfair Aimbot: [^2ON^5]^7");
        self.unfairAimbot = true;
    }
    else
    {
        self notify("end_unfairAimbot");

        self iprintln("^5Unfair Aimbot: [^1OFF^5]^7");
        self.unfairAimbot = false;
    }
}

initUnfairAimbot()
{
    self endon("disconnect");
    self endon("death");
    self endon("end_unfairAimbot");

    for (;;)
    {
        aimAt = undefined;

        foreach (player in level.players)
        {
            if ((player == self) || (!isAlive(player)) || (level.teambased && self.pers["team"] == player.pers["team"]))
            continue;

            if (isDefined(aimAt))
            {
                if (closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
                aimAt = player;
            }
            else aimAt = player;
        }
        if (isDefined(aimAt))
        {
            if (self adsButtonPressed())
            {
                self getPlayerAngles(VectortoAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head"))));
                if (self attackButtonPressed())
					aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
            }
        }
        wait 0.01;
    }
}

LegitAimbot()
{
    if (self.legitAimbot == false)
    {
        self thread initLegitAimbot();

        self.legitaimbot = true;
        self iprintln("^5Legit Aimbot: [^2ON^5]^7");
    }
    else
    {
        self notify("end_LegitAimbot");

        self.legitaimbot = false;
        self iprintln("^5Legit Aimbot: [^1OFF^5]^7");
    }
}

initLegitAimbot()
{
    self endon("death");
    self endon("disconnect");
    self endon("end_LegitAimbot");

    lo = -1;
    self.fire = 0;
    self.pnum = 0;
    self thread wFired();

    for (;;)
    {
        wait 0.01;

        if (self adsButtonPressed())
        {
            for (i = 0; i < level.players.size; i++)
            {
                if (getDvar("g_gametype") != "dm")
                {
                    if (closer (self.origin, level.players[i].origin, lo) == true && level.players[i].team != self.team && isAlive(level.players[i]) && level.players[i] != self && bulletTracePassed(self getTagOrigin("j_head"), level.players[i] getTagOrigin("pelvis"), 0, self)) lo = level.players[i] getTagOrigin("pelvis");
                        else if (closer (self.origin, level.players[i].origin, lo) == true && level.players[i].team != self.team && isAlive(level.players[i]) && level.players[i] getCurrentWeapon() == "riotshield_mp" && level.players[i] != self && bulletTracePassed(self getTagOrigin("j_head"), level.players[i] getTagOrigin("pelvis"), 0, self)) lo = level.players[i] getTagOrigin("j_ankle_ri");
                }
                else
                {
					if(closer (self.origin, level.players[i].origin, lo) == true && IsAlive(level.players[i]) && level.players[i] != self && bulletTracePassed(self getTagOrigin("j_head"), level.players[i] getTagOrigin("pelvis"), 0, self)) lo = level.players[i] gettagorigin("pelvis");
                    	else if(closer (self.origin, level.players[i].origin, lo) == true && IsAlive(level.players[i]) && level.players[i] getcurrentweapon()=="riotshield_mp" && level.players[i] != self && bulletTracePassed(self getTagOrigin("j_head"), level.players[i] getTagOrigin("pelvis"), 0, self)) lo = level.players[i] gettagorigin("j_ankle_ri");
                }
            }
            if (lo != 1) self setPlayerAngles(VectortoAngles((lo) - (self getTagOrigin("j_pelvis"))));

            if (self.fire == 1)
                magicBullet(self getCurrentWeapon(), lo+ (0, 0, 10), lo, self);
        }
        lo = -1;
    }
}


wFired()
{
    self endon("disconnect");
    self endon("death");
    self endon("end_LegitAimbot");

    for (;;)
    {
        self waittill("weapon_fired");
        self.fire = 1;
        wait 0.05;
        self.fire = 0;
    }
}

TrickshotAimbot()
{
    if (self.trickshotAimbot == false)
    {
        self thread initTrickshotAimbot();
        
        self.trickshotAimbot = true;
        self iprintln("^5Trickshot Aimbot: [^2ON^5]^7");
    }
    else 
    {
        self notify("end_TrickshotAimbot");

        self.trickshotAimbot = false;
        self iprintln("^5Trickshot Aimbot: [^1OFF^5]^7");
    }
}

initTrickshotAimbot()
{
    self endon("disconnect");
    self endon("end_TrickshotAimbot");

    for (;;)
    {
        self waittill("weapon_fired");

        abc = 0;
        def = 0;
        foreach (player in level.players)
        {
            if (self.pers["team"] != player.pers["team"] && isAlive(player))
            {
                if(isSubStr(self getCurrentWeapon(), "svu_") || isSubStr(self getCurrentWeapon(), "dsr50_") || isSubStr(self getCurrentWeapon(), "ballista_") || isSubStr(self getCurrentWeapon(), "as50_"))
                {
                    x = randomint(10);

                    if (x == 1 && def < 1)
                    {
                        player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_head", 0, 0);
                        def++;
                    }
                    else if (x > 1 && def < 1)
                    {
                        player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0, 0);
                        def++;
                    }
                }
            }
            if (isAlive(player) && player.pers["team"] == "axis")
            {
                abc++;
            }
        }
        if (abc == 0)
        {
            self notify("last_killed");
        }
    }
}

NoScopeAimbot()
{
    if (self.noScopeAimbot == false)
    {
        self thread initNoScopeAimbot();
        
        self.noScopeAimbot = true;
        self iprintln("^5NoScope Aimbot: [^2ON^5]^7");
    }
    else 
    {
        self notify("end_NoScopeAimbot");

        self.noScopeAimbot = false;
        self iprintln("^5NoScope Aimbot: [^1OFF^5]^7");
    }
}

initNoScopeAimbot()
{
    self endon("disconnect");
    self endon("end_NoScopeAimbot");

    for (;;)
    {
        self waittill("weapon_fired");

        abc = 0;
        def = 0;
        foreach (player in level.players)
        {
            if (self.pers["team"] != player.pers["team"] && isAlive(player))
            {               
                x = randomint(10);

                if (x == 1 && def < 1)
                {
                    player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_head", 0, 0);
                    def++;
                }
                else if (x > 1 && def < 1)
                {
                    player thread [[level.callbackPlayerDamage]] (self, self, 500, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0, 0);
                    def++;
                }
            }
            if (isAlive(player) && player.pers["team"] == "axis")
            {
                abc++;
            }
        }
        if (abc == 0)
        {
            self notify("last_killed");
        }
    }
}

    // lobby

TrickshotLobby()
{
    if (self.trickshotLobby == false)
    {
        self thread Typewriter("^5Trickshot ^6Lobby!");
        self.hearAll = false;
        self thread HearAll();
        self.unlimitedGame = false;
        self thread unlimitedGame();
        self.gravity = true;
        self thread LowGravity();
        level.superjump = undefined;
        self thread SuperJump();

        self iprintln("^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=");
        self iprintln("^2Trickshot Lobby Enabled");
        self iprintln("^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=");
        self.trickshotLobby = true;
    }
    else
    {
        self.hearall = true;
        self thread HearAll();
        self.unlimitedGame = true;
        self thread unlimitedGame();
        self.gravity = false;
        self thread LowGravity();
        level.superjump = true;
        self thread SuperJump();

        self iprintln("^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=");
        self iprintln("^1Trickshot Disabled");
        self iprintln("^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=^5=^1=");
        self.trickshotLobby = false;
    }
}


HearAll()
{
    if (self.hearAll == false)
    {
        SetMatchTalkFlag("EveryoneHearsEveryone", 1);
        
        self.hearAll = true;
        self iprintln("^5Hear All Players: [^2ON^5]^7");
    }
    else
    {
        SetMatchTalkFlag("EveryoneHearsEveryone", 0);

        self.hearAll = false;
        self iprintln("^5Hear All Players: [^1OFF^5]^7");
    }
}

UnlimitedGame()
{
    if (self.unlimitedGame == false)
    {
        setDvar("scr_dom_scorelimit", 0);
        setDvar("scr_sd_numlives", 0);
        setDvar("scr_war_timelimit", 0);
        setDvar("scr_game_onlyheadshots", 0);
        setDvar("scr_war_scorelimit", 0);
		maps/mp/gametypes/_globallogic_utils::pausetimer();

        self.unlimitedGame = true;
        self iprintln("^5Infinite Game: [^2ON^5]^7");
    }
    else
    {
		self maps/mp/gametypes/_globallogic_utils::resumetimer();
        self.unlimitedGame = false;
        self iprintln("^5Infinite Game: [^1OFF^5]^7");
    }
}

AntiQuit()
{
    if (getDvar("antiQuitDvar") == "" || getDvar("antiQuitDvar") == "0")
    {
        level thread initAntiQuit();
        setDvar("antiQuitDvar", "1");
        self iprintln("^5Anti-Quit: [^2ON^5]^7");
    }
    else
    {
        level notify("end_AntiQuit");
        setDvar("antiQuitDvar", "0");
        self iprintln("^5Anti-Quit: [^1OFF^5]^7");
    }
}

initAntiQuit()
{
    level endon("disconnect");
    level endon("end_AntiQuit");
    for(;;)
    {
        foreach(player in level.players)
        {
            if (!player isHost() && player.status != "Host" && player.status != "Co-Host")
                player maps/mp/gametypes/_globallogic_ui::closemenus();

        }
        wait 0.03;
    }
}

LowGravity()
{
    if (self.gravity == true)
    {
        setDvar("bg_gravity", "100");
        
        self.gravity = false;
        self iprintln("^5Low Gravity: [^2ON^5]^7");
    }
    else
    {
        setDvar("bg_gravity", "800");

        self.gravity = true;
        self iprintln("^5Low Gravity: [^1OFF^5]^7");
    }
}

SuperJump()
{
	if(!isDefined(!level.superjump))
	{
		level.superjump = true;
		for(i = 0; i < level.players.size; i++)level.players[i] thread initSuperJump();
	}
	else
	{
		level.superjump = undefined;
		for(x = 0; x < level.players.size; x++)level.players[x] notify("end_SuperJump");
	}
	self iPrintln("^5Super Jump: " + boolText(level.superjump));
}

initSuperJump()
{
    self endon("disconnect");
    self endon("end_SuperJump");
    for (;;)
    {
        if (self JumpButtonPressed() && !isDefined(self.allowedtoPress))
        {
            for (i = 0; i < 10; i++)
            {
                self.allowedtoPress = true;
                self setVelocity(self getVelocity() + (0, 0, 999));

                wait 0.05;
            }
            self.allowedtoPress = undefined;
        }
        wait 0.05;
    }
}

SuperSpeed()
{
    if (level.superSpeed == false)
    {
        setDvar("g_speed", "500");
        level.superSpeed = true;

        self iprintln("^5Super Speed: [^2ON^5]^7");
    }
    else
    {
        setDvar("g_speed", "190");
        level.superSpeed = false;

        self iprintln("^5Super Speed: [^1OFF^5]^7");
    }
}

MapRestart()
{
    foreach (player in level.players)
    {
        destroyMenu(player);
    }
    self iprintln("^5Restarting Now!");
    map_restart(false);
}

InstantEndGame()
{
    exitlevel(false);
}

Timescale()
{
    if (level.currentTimescale == 1)
    {
        setDvar("timescale", "0.5");
        
        self iprintln("^5Timescale set to ^1Slow");
        level.currentTimescale = 2;
    }
    else
    {
        if (level.currentTimescale == 2)
        {
            setDvar("timescale", "1.5");
            
            self iprintln("^5Timescale set to ^5Fast");
            level.currentTimescale = 3;
        }
        else
        {
            if (level.currentTimescale == 3)
            {
                setDvar("timescale", "1");

                self iprintln("^5Timescale set to ^2Normal");
                level.currentTimescale = 1;
            }
        }
    }
}

LockedLobby()
{
    if (self.lockedLobby == false)
    {
        self.lockedLobby = true;
        level.locked = true;

        self iprintln("^5Locked Lobby: [^2ON^5]^7");
    }
    else
    {
        self.lockedLobby = false;
        self.locked = false;

        self iprintln("^5Locked Lobby: [^1OFF^5]^7");
    }
}

EndGame()
{
    self iprintln("^5Game Ended!");

    level thread maps/mp/gametypes/_globallogic::endgame("axis", "^1" + (level.hostname  + "^5Won the Game"));
    level thread maps/mp/gametypes/_globallogic::endgame("allies", "^1" + (level.hostname + "^5Won the Game"));
    level thread maps/mp/gametypes/_globallogic::forceend();

}

RemoveSkyBarrier()
{
	self iprintln("^5Sky Barrier: [^6Removed^5]^7");
	entarray = getentarray();
	index = 0;
	while(index < entarray.size)
	{
		if(entarray[ index].origin[ 2] > 180 && issubstr(entarray[ index].classname, "trigger_hurt"))
		{
			entarray[ index].origin = (0, 0, 9999999);
		}
		index++;
	}
}


//Floater ON/OFF

Floaters()
{
	if(self.floaters == false){

		self iprintln("^5Floaters: [^1OFF^5]^7");
        self thread initFloaters();
		self.floaters = true;

	}else if(self.floaters == true){

		self iprintln("^5Floaters: [^2ON^5]^7");
        self notify("end_Floaters");
		self.floaters = false;

	}
}

initFloaters()
{
    self endon("end_Floaters");
	level waittill("game_ended");

	foreach(player in level.players)
    {

        if(isAlive(player) && !player isOnGround() && player.floaters)
        {
            player thread FloatersDown();
        }
    }
}

FloatersDown(){

    z = 0;
    startingOrigin = self getOrigin();
    floaterPlatform = spawn("script_model", startingOrigin - (0, 0, 20));
    playerAngles = self getPlayerAngles();
    floaterPlatform.angles=(0, playerAngles[1] , 0);
    floaterPlatform setModel("collision_clip_32x32x10");

    for(;;){

        z++;
        floaterPlatform.origin=(startingOrigin - (0, 0, z*1 ));

        wait .01;

    }

}

doHeart()
{
    while (!(isDefined(level.heartText)))
    {
        level.heartText = level createServerFontString("hudbig", 4);
        level.heartText.alignx = "right";
        level.heartText.horzalign = "right";
        level.heartText.vertalign = "middle";
        level.heartText.x = 30;
        level.heartText setText("^6Rewritten by:\n^4-->^5@gasps\n^6Created by:\n^4-->^5 AirShoT Modz\n^4-->^5 RyGuyModz");
        level.doHeart = true;

        level.heartText.alpha = 1;
        self iprintln("^5Heart: [^2ON^5]^7");

        level.heartText.glowalpha = 1;
        level.heartText.glowcolor = (randomInt(255) / 255, randomInt(255) / 255, randomInt(255) / 255);
        level.heartText setPulseFX(40, 2000, 600);

        wait 0.7;
    }
    if (level.doHeart == false)
    {
        self iprintln("^5Heart: [^2ON^5]^7");
        level.doHeart = true;
        level.heartText.alpha = 1;
    }
    else
    {
        if (level.doHeart == true)
        {
            self iprintln("^5Heart: [^1OFF^5]^7");
            level.heartText.alpha = 0;
            level.doHeart = false;
        }
    }
}

ChangeMap(MapName)
{
    self iprintlnbold("^5Map Being Changed To ^2" + MapName + "!");


    wait 0.50;

    setDvar("ls_mapname", MapName);
    setDvar("mapname", MapName);
    setDvar("party_mapname", MapName);
    setDvar("ui_mapname", MapName);
    setDvar("ui_currentMap", MapName);
    setDvar("ui_mapname", MapName);
    setDvar("ui_preview_map", MapName);
    setDvar("ui_showmap", MapName);
    map(mapName);    
    
    wait 3;
    map_restart(true);
}

add1Kill()
{
    self givePointsToWin(1);
    self iprintlnbold("^51 Kill ^6Given");
}

add5Kills()
{
    self givePointsToWin(5);
    self iprintlnbold("^55 Kills ^6Given");
}

add10Kills()
{
    self givePointsToWin(10);
    self iprintlnbold("^510 Kills ^6Given");
}

add29Kills()
{
    givePointsToWin(29);
    self iprintln("^529 Kills ^6Given");
}

InstantLast()
{
	if(getdvar( "g_gametype" ) == "tdm")
    {   

        self.pointstowin = level.scorelimit - 1; // change all the 1's to your kill limit... if it was 10, do 9, and edit the score. self.score goes by 200's
	    self.pers["pointstowin"] = level.scorelimit - 1;
	    self.score = (level.scorelimit-1) * 100;
	    self.pers["score"] = (level.scorelimit - 1) * 100;
	    self.teamscore = level.scorelimit - 1;
	    self.deaths = 0;
	    self.headshots = 0;
	    self.pers["kills"] = self maps/mp/gametypes/_globallogic_score::_setteamscore(self.pers["team"], level.scorelimit - 1);
	    self.pers["deaths"] = 0;
	    self.pers["headshots"] = 0;
        self iPrintlnBold ("^5Instant Last!");
    }
      if (getdvar("g_gametype") == "dm")
      {
        self.pointstowin = level.scorelimit - 1;
	    self.pers["pointstowin"] = level.scorelimit - 1;
	    self.score = (level.scorelimit-1) * 100;
	    self.pers["score"] = (level.scorelimit - 1) * 100;
	    self.kills = level.scorelimit - 1;
	    self.deaths = 0;
	    self.headshots = 0;
	    self.pers["kills"] = level.scorelimit - 1;
	    self.pers["deaths"] = 0;
	    self.pers["headshots"] = 0;
	    self iPrintlnBold ("^5Instant Last!");
      }
}

Canswap(gun)
{
    weap = gun;
    self giveWeapon(weap);
    wait 0.1;
    self dropItem(weap);
    self iprintln("^6" + gun + "5Dropped");
}

togglenac()
{
	if(self.nac)
	{
		self.nac = 0;
		self iprintln("Nac Bind ^1Disabled");
	}
	else
	{
		self.nac = 1;
		self iprintln("Nac Bind ^2Enabled");
		self iprintln("Press [{+actionslot 3}] To Save Weapons & Nac Swap");
	}

}


donac()
{
	self endon("disconnect");
	level endon("game_ended");
	self endon("death");
	if (self getCurrentWeapon() == self.wep2)
	{
		ammow2 = self getweaponammostock(self.wep2);
		ammocw2 = self getweaponammoclip(self.wep2);
		if (isSubStr (self getCurrentWeapon(), "ksg_") || isSubStr (self getCurrentWeapon(), "870mcs_") || isSubStr (self getcurrentweapon(), "saiga12_") || isSubStr(self getCurrentWeapon(), "srm1216_"))
		{
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep);
			self setSpawnWeapon(self.wep);
			while (!(self getCurrentWeapon() == self.wep))
			{
				wait 0.01;
			}
			self giveWeapon(self.wep2, 0, self.camo, 0, 0, 0, 0);
			self setWeaponAmmoStock(self.wep2, ammow2);
			self setWeaponAmmoClip(self.wep2, ammocw2);
		}
		else
		{
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep);
			if (self adsButtonPressed())
			{
				wait 0.3;
				self setSpawnWeapon(self.wep);
			}
			while (!(self getCurrentWeapon() == self.wep))
			{
				wait 0.01;
			}
			self giveWeapon(self.wep2, 0, self.camo, 0, 0, 0, 0);
			self setWeaponAmmoStock(self.wep2, ammow2);
			self setWeaponAmmoClip(self.wep2, ammocw2);
		}
	}
	else
	{
		if (self getcurrentweapon() == self.wep)
		{
			ammow1 = self getweaponammostock(self.wep);
			ammocw1 = self getweaponammoclip(self.wep);
		    if (isSubStr (self getCurrentWeapon(), "ksg_") || isSubStr (self getCurrentWeapon(), "870mcs_") || isSubStr (self getcurrentweapon(), "saiga12_") || isSubStr(self getCurrentWeapon(), "srm1216_"))
			{
				self takeWeapon(self.wep);
				self switchToWeapon(self.wep2);
				wait 0.3;
				self setSpawnWeapon(self.wep2);
				while (!(self getCurrentWeapon() == self.wep2))
				{
					wait 0.01;
				}
				self giveWeapon(self.wep, 0, self.camo, 0, 0, 0, 0);
				self setWeaponAmmoStock(self.wep, ammow1);
				self setWeaponAmmoClip(self.wep, ammocw1);
			}
			else
			{
				self takeWeapon(self.wep);
				self switchToWeapon(self.wep2);
				if (self adsButtonPressed())
				{
					wait 0.3;
					self setSpawnWeapon(self.wep2);
				}
				while (!(self getCurrentWeapon() == self.wep2))
				{
					wait 0.01;
				}
				self giveWeapon(self.wep, 0, self.camo, 0, 0, 0, 0);
				self setWeaponAmmoStock(self.wep, ammow1);
				self setWeaponAmmoClip(self.wep, ammocw1);
			}
		}
		else
		{
			if( self getCurrentWeapon() != "none" )
			{
				self.count = 1;
				self iprintlnbold( "^1Warning^7 : Saved Wrong Weapon" );
			}
		}
	}

}

savebindweapons()
{
	if (self.count == 1)
	{
		if (self getCurrentWeapon() != "none")
		{
			self.wep = self getCurrentWeapon();
			self.count++;
			self iprintlnbold("[^2#^11^7] " + self.wep);
		}
	}
	else
	{
		if (self.count == 2)
		{
			if (self.wep != self getCurrentWeapon())
			{
				if (self getCurrentWeapon() != "none")
				{
					self.wep2 = self getCurrentWeapon();
					self.count++;
					self iprintlnbold("[^2#^12^7] " + self.wep2);
				}
			}
		}
	}
}

monitorbinds()
{
	self endon( "disconnect" );
	self endon( "destroyMenu" );
	level endon( "game_ended" );
	if (self.nac)
	{
		if (self getStance() != "prone" && self ActionSlotThreeButtonPressed()())
		{
			if (self.count < 3 )
			{
				self savebindweapons();
			}
			else
			{
				self donac();
			}
		}
	}
	wait 0.05;
}

// utils

Typewriter(message)
{
    foreach (player in level.players)
    {
        player thread hintMessage(message);
    }
}

boolText(var)
{
    if (!isDefined(var))
    return "^5[^1OFF^5]^7";
    else
    return "^5[^2ON^5]^7";
}

giveGunUtil(code, name, camo, enable)
{
    if (camo == 0)
    {
        self giveWeapon(code, 0, false);
    }
    else
    {
        self giveWeapon(code, 0, true(camo, 0, 0, 0, 0));
    }

    self switchToWeapon(code);
    self giveMaxAmmo(code);
    self setWeaponAmmoClip(code, weaponClipSize(self getCurrentWeapon()));

    if (enable == 1)
    {
        self iprintln("^5Give weapon to ^6" + name);
    }
}





