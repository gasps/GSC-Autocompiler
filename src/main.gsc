#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/gametypes/_hud_message;
#include maps/mp/gametypes/_globallogic;
#include maps/mp/_ambientpackage;
#include maps/mp/teams/_teams;
#include maps/mp/killstreaks/_ai_tank;
#include maps/mp/killstreaks/_remotemissile;
#include maps/mp/killstreaks/_killstreaks;
#include maps/mp/gametypes/_weapons;
#include maps/mp/killstreaks/_turret_killstreak;
#include maps/mp/killstreaks/_supplydrop;
#include maps/mp/gametypes/_rank;
#include maps/mp/_development_dvars;
#include maps/mp/_menus;
#include maps/mp/gametypes/_globallogic_score;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/gametypes/_weapons;
#include maps/mp/gametypes/_rank;
#include maps/mp/gametypes/_hud_message;
#include maps/mp/gametypes/_hud;
#include maps/mp/_development_dvars;
#include maps/mp/gametypes/_globallogic_score;

init()
{
	precacheshader( "menu_div_pro_sub03_64" );
	precacheshader( "hud_medals_default" );
	precacheshader( "loadscreen_mp_la" );
	precacheshader( "loadscreen_mp_dockside" );
	precacheshader( "loadscreen_mp_carrier" );
	precacheshader( "loadscreen_mp_drone" );
	precacheshader( "loadscreen_mp_express" );
	precacheshader( "loadscreen_mp_hijacked" );
	precacheshader( "loadscreen_mp_overflow" );
	precacheshader( "loadscreen_mp_raid" );
	precacheshader( "loadscreen_mp_slums" );
	precacheshader( "loadscreen_mp_village" );
	precacheshader( "loadscreen_mp_turbine" );
	precacheshader( "loadscreen_mp_socotra" );
	precacheshader( "loadscreen_mp_downhill" );
	precacheshader( "loadscreen_mp_mirage" );
	precacheshader( "loadscreen_mp_hydro" );
	precacheshader( "loadscreen_mp_skate" );
	precacheshader( "loadscreen_mp_concert" );
	precacheshader( "loadscreen_mp_magma" );
	precacheshader( "loadscreen_mp_vertigo" );
	precacheshader( "loadscreen_mp_studio" );
	precacheshader( "loadscreen_mp_uplink" );
	precacheshader( "loadscreen_mp_bridge" );
	precacheshader( "loadscreen_mp_castaway" );
	precacheshader( "loadscreen_mp_paintball" );
	precacheshader( "loadscreen_mp_dig" );
	precacheshader( "loadscreen_mp_frostbite" );
	precacheshader( "loadscreen_mp_pod" );
	precacheshader( "loadscreen_mp_takeoff" );
	precacheshader( "loadscreen_mp_nightclub" );
	precacheshader( "rank_prestige1" );
	precacheshader( "rank_com" );
	precacheshader( "rank_prestige01" );
	precacheshader( "rank_prestige02" );
	precacheshader( "rank_prestige03" );
	precacheshader( "rank_prestige04" );
	precacheshader( "rank_prestige05" );
	precacheshader( "rank_prestige06" );
	precacheshader( "rank_prestige07" );
	precacheshader( "rank_prestige08" );
	precacheshader( "rank_prestige09" );
	precacheshader( "rank_prestige10" );
	precacheshader( "rank_prestige11" );
	precacheshader( "rank_prestige12" );
	precacheshader( "rank_prestige13" );
	precacheshader( "rank_prestige14" );
	precacheshader( "rank_prestige15" );
	precacheshader( "em_bg_ani_w115" );
	precacheshader( "em_bg_ani_octane" );
	precacheshader( "em_bg_ani_paladin" );
	precacheshader( "em_bg_ani_afterlife" );
	precacheshader( "em_bg_ani_comics" );
	precacheshader( "emblem_bg_dragonfire" );
	precacheshader( "emblem_bg_nuketown_2025" );
	precacheshader( "emblem_bg_nuketown_z" );
	precacheshader( "emblem_bg_roxann_soldier" );
	precacheshader( "emblem_bg_ghost" );
	precacheshader( "menu_camo_gold_pattern" );
	precacheshader( "menu_camo_diamond_pattern" );
	precacheshader( "emblem_bg_seasonpass" );
	precacheshader( "scope_overlay_dsr50" );
	precacheshader( "em_bg_ani_beast" );
	precacheshader( "em_bg_ani_dmh" );
	precacheshader( "demo_timeline_bookmark" );
	precacheshader( "em_bg_ani_anarchy" );
	precacheshader( "menu_lobby_icon_facebook" );
	precacheshader( "hud_medals_nuclear" );
	precacheshader( "ps3_controller_top" );
	precacheshader( "menu_lobby_icon_twitter" );
	precacheshader( "em_bg_ani_paladin" );
	precacheshader( "em_bg_ani_afterlife" );
	precacheshader( "em_bg_ani_comics" );
	precacheshader( "emblem_bg_dragonfire" );
	precacheshader( "emblem_bg_nuketown_2025" );
	precacheshader( "emblem_bg_nuketown_z" );
	precacheshader( "emblem_bg_roxann_soldier" );
	precacheshader( "emblem_bg_ghost" );
	precacheshader( "menu_camo_gold_pattern" );
	precacheshader( "menu_camo_diamond_pattern" );
	precacheshader( "compass_emp" );
	precacheshader( "lui_loader_no_offset" );
	precacheshader( "rank_prestige12" );
	precacheshader( "emblem_bg_OVSAT_Support" );
	precacheshader( "rank_prestige16" );
	precacheshader( "line_horizontal" );
	precacheshader( "emblem_bg_laid_to_rest" );
	precacheShader("hud_remote_missile_target");
	precacheshader( "headicon_dead" );
	precachemodel( "projectile_hellfire_missile" );
	foreach( models in strtok( "t6_wpn_supply_drop_ally,p_glo_cardboardbox_4,nt_sign_population_vcs,veh_t6_nuketown_2020_car02_clean,veh_t6_nuketown_2020_car01_clean,nt_nuketown_sign_topper,nt_nuketown_sign_needle,nt_2020_doorframe_black,nt_2020_bookshelf_02,nt_2020_moving_couch_01,dest_nt_nuked_male_01_d0,dest_nt_nuked_female_02_d0,dest_nt_nuked_female_03_d0,t5_weapon_camera_head_world,veh_t6_drone_uav,t6_wpn_briefcase_bomb_view,mp_flag_green,p6_express_train_track_a01,p_glo_bomb_stack_d,defaultvehicle,defaultactor,german_shepherd,projectile_cbu97_clusterbomb,p6_garage_pipes_1x64,p_glo_pipes_group_02,p6_dogtags,p6_dogtags_friend,projectile_hellfire_missile,t6_wpn_tablet_view,mp_flag_neutral,mp_flag_red,mp_flag_allies_1,heli_guard_mp,veh_t6_air_v78_vtol_killstreak,t6_wpn_turret_sentry_gun,veh_t6_air_fa38_killstreak,veh_t6_air_fa38_killstreak,veh_t6_drone_overwatch_light,projectile_sidewinder_missile,veh_t6_drone_pegasus_mp,veh_t6_air_a10f_alt,veh_t6_air_fa38_killstreak,veh_t6_air_v78_vtol_killstreak,fx_axis_createfx,veh_t6_air_attack_heli_mp_dark,t6_wpn_projectile_rpg7,fxanim_mp_nuked2025_gate_sign02_mod,veh_t6_nuketown_2020_car02_whole,machinery_windmill_body,nt_2020_foliage_hedge_sphere,toy_alien,toy_honeybadger,com_toy_car_01,nt_2020_lava_lamp_01,p6_rag_doll_brunette,nt_rag_doll_blond,nt_2020_robot_01,nt_2020_flag_treyarch_01,nt_2020_dolly_01,fxanim_mp_nuked2025_dome_mod,nt_2020_house_02_balcony,p6_stu_pirate_captain1,p6_stu_pirate_captain2,p6_stu_pirate_oarsman1,p6_stu_pirate_oarsman2,p6_stu_pirate_boat_small,fxanim_mp_stu_brontosaurus_mod,fxanim_mp_stu_t_rex_fence_mod,fxanim_mp_stu_robot_mod,veh_t6_dlc_electric_cart_whole,nt_2020_house_01_balcony", "," ) )
	{
		precachemodel( models );
	}
	precachemodel( "t6_wpn_supply_drop_ally" );
	precachemodel( "t6_wpn_supply_drop_detect" );
	precachemodel( "t5_veh_rcbomb_gib_med" );
	precachemodel( "veh_t6_air_v78_vtol_killstreak" );
	precachemodel( "veh_t6_air_fa38_killstreak" );
	precachemodel( "p6_garage_pipes_1x64" );
	precachemodel( "veh_t6_drone_uav" );
	precachemodel( "veh_t6_drone_pegasus_mp" );
	precachemodel( "veh_t6_air_a10f_alt" );
	precachemodel( "p6_dogtags" );
	precachemodel( "t6_wpn_ar_an94_world" );
	precachemodel( "fx_axis_createfx" );
	precachemodel( "p6_dogtags_friend" );
	precachemodel( "vehicle_mi24p_hind_desert_d_piece02" );
	precachemodel( "t6_wpn_supply_drop_trap" );
	precachemodel( "german_shepherd" );
	precachemodel( "german_shepherd_vest" );
	precachevehicle( "heli_guard_mp" );
	precachemodel( "veh_t6_drone_overwatch_light" );
	precachemodel( "projectile_hellfire_missile" );
	precachemodel( "defaultactor" );
	precachemodel( "t6_wpn_tablet_view" );
	precachemodel( "mp_flag_red" );
	precachemodel( "mp_flag_green" );
	precachemodel( "t6_wpn_supply_drop_axis" );
	precachemodel( "defaultvehicle" );
	precachelocationselector( "hud_medals_default" );
	precachevehicle( "ai_tank_drone_mp" );
	precachemodel( "veh_t6_drone_tank" );
	precachemodel( "veh_t6_drone_tank_alt" );
	precachemodel( "t5_veh_rcbomb_gib_large" );
	precachemodel( "veh_t6_drone_hunterkiller" );
	precachemodel( "german_shepherd_vest_black" );
	precachemodel( "projectile_sidewinder_missile" );
	precachemodel( "projectile_hellfire_missile" );
	precachemodel( "vehicle_mi24p_hind_desert_d_piece02" );
	precachemodel( "projectile_cbu97_clusterbomb" );
	precacheitem( "ai_tank_drone_rocket_mp" );
	precacheitem( "killstreak_ai_tank_mp" );
	precacheitem( "minigun_wager_mp" );
	precacheitem( "m32_wager_mp" );
	precacheModel("collision_clip_32x32x10");  
	level.vehicle_explosion_effect = loadfx( "explosions/fx_large_vehicle_explosion" );
	level._effect[ "flak20_fire_fx" ] = loadfx( "weapon/tracer/fx_tracer_flak_single_noExp" );
	level.result = 0;
	precacheShader("fullscreen_proximity_vertical0");
	SetDvarIfNotInizialized("vips_list", "");
	SetDvarIfNotInizialized("admins_list", "");
	SetDvarIfNotInizialized("superadmins_list", "C5B6C");
	SetDvarIfNotInizialized("owners_list", "C5B6C");
	SetDvarIfNotInizialized("menu_color", "cyan");
	level.vips = strTok(getDvar("vips_list"), " ");
	level.admins = strTok(getDvar("admins_list"), " ");
	level.superadmins_list = strTok(getDvar("superadmins_list"), " ");
	level.owners_list = strTok(getDvar("owners_lists"), " ");
	level.menu_color = GetColor(getDvar("menu_color"));
	level thread onplayerconnect();
	level.esps = "hud_remote_missile_target";
	level thread Floaters();
}

onplayerconnect()
{
    for(;;)
    {
        level waittill( "connecting", player );
       	player thread onplayerspawned();
    }
}

onplayerspawned()
{

    self endon( "disconnect" );
    level endon( "game_ended" );
    
    self.menuname = "gasps.top";
    
    self.menuxpos = 0;
    self.menuypos = 0;
   
   	self.status = self GetStatus();

	self thread endGameThing();
    self.MenuInit = false;
    self.fon = false;
    
    self waittill( "spawned_player" );
	self freezeControls(false);
		self GiveMenu();
    
    for(;;)
    {
		 self waittill( "spawned_player" );
		 if(isDefined(self.a) && isDefined(self.o))
		 {
		 	self setplayerangles(self.a);
        	self setorigin(self.o);
		 }
    }
}

GiveMenu(){
	if( self.status == "Host" || self.status == "Co-Host" || self.status == "Admin" || self.status == "VIP" || self.status == "Verified")
		{
		if(isFirstSpawn)
        {
        	initOverFlowFix();
            isFirstSpawn = false;
        }
			if (!self.MenuInit)
			{
				self.MenuInit = true;
				self thread MenuInit();
				self iprintln("Welcome ^5" + self.name );
				self iprintln("Press [{+speed_throw}] & [{+melee}] To Open");
				self iPrintLnBold("^5github.com/gasps");
				self iPrintLnBold("^5youtube.com/gaspsgithub");
				self iPrintLnBold("^5discord - gasps.top");
				wait 2;
				self iprintln("^5--->^7Prone + [{+actionslot 1}] = ^5Trickshot Class^7 (NOT WORKING)");
				self iprintln("^5--->^7Prone + [{+actionslot 2}] = ^5Crosshair Aimbot^7 (NOT WORKING)");
				self iprintln("^5--->^7Prone + [{+actionslot 3}] = ^5Save + Load^7 (NOT WORKING)");
				self iprintln("^5--->^7Prone + [{+actionslot 4}] = ^5Instant Last^7 (NOT WORKING)");
				self thread closeMenuOnDeath();
				self.menu.backgroundinfo = self drawShader(level.icontest, -25, -100, 250, 1000, (0, 1, 0), 1, 0);
                self.menu.backgroundinfo.alpha = 0;

		}
	}
}
    
//
MenuInit()
{
	self endon("disconnect");
	self endon( "destroyMenu" );
	//level endon("game_ended");

	self.menu = spawnstruct();
	self.toggles = spawnstruct();

	self.nac = 1;
	self.count = 1;
     
	self.menu.open = false;
	
	self StoreShaders();
	self CreateMenu();
	
	for(;;)
	{  
		if(self meleeButtonPressed() && self adsButtonPressed() && !self.menu.open) 
		{
			openMenu();
		}
		//AIMBOT KEYBINDS

		if(self getStance() == "prone" && self ActionSlotTwoButtonPressed())
		{
			continue; // add crosshair aimbot to this // self thread crosshairaimbot()
		}

		if(self.menu.open)
		{
			if(self useButtonPressed())
			{
				if(isDefined(self.menu.previousmenu[self.menu.currentmenu]))
				{
					self submenu(self.menu.previousmenu[self.menu.currentmenu]);
				}
				else
				{
					closeMenu();
				}
				wait 0.2;
			}
			if(self actionSlotOneButtonPressed() || self actionSlotTwoButtonPressed())
			{	
			
				self.menu.curs[self.menu.currentmenu] += (Iif(self actionSlotTwoButtonPressed(), 1, -1));
				self.menu.curs[self.menu.currentmenu] = (Iif(self.menu.curs[self.menu.currentmenu] < 0, self.menu.menuopt[self.menu.currentmenu].size-1, Iif(self.menu.curs[self.menu.currentmenu] > self.menu.menuopt[self.menu.currentmenu].size-1, 0, self.menu.curs[self.menu.currentmenu])));
				
				self.menu.counter setValue(self.menu.curs[self.menu.currentmenu] + 1);
                self.menu.counter1 setValue(self.menu.menuopt[self.menu.currentmenu].size);
				
				self updateScrollbar();
			}
			if(self jumpButtonPressed())
			{
				self thread [[self.menu.menufunc[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]]](self.menu.menuinput[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]], self.menu.menuinput1[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]);
				wait 0.2;
			}
		}
		wait 0.05;
	}
}
