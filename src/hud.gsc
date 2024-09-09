drawText(text, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort)
{
    hud = self createFontString(font, fontScale);
    hud setText(text);
    hud.x = x;
    hud.y = y;
    hud.color = color;
    hud.alpha = alpha;
    hud.glowColor = glowColor;
    hud.glowAlpha = glowAlpha;
    hud.sort = sort;
    hud.alpha = alpha;
    return hud;
    level.result += 1;
	textElem setText(text);
	level notify("textset");
}

drawShader(shader, x, y, width, height, color, alpha, sort)
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud.x = x;
    hud.y = y;
    return hud;
}

StoreShaders()
{
	self.menu.background = self drawshader( "white", 130, 60, 150, 300, ( 0, 0, 0 ), 0, 0 );
	self.menu.background1 = self drawshader( "white", 130, 60, 150, 300, ( 0, 0, 0 ), 0, 0 );
	self.menu.scroller = self drawshader( "white", 130, -500, 150, 14, ( 0, 0.588, 0.988 ), 255, 1 );
	self.menu.line = self drawshader( "white", 205, -550, 2, 300, ( 0, 0.588, 0.988 ), 255, 3 );
	self.menu.line2 = self drawshader( "white", 55, -550, 2, 300, ( 0, 0.588, 0.988 ), 255, 4 );
	self.menu.line3 = self drawshader( "white", 130, -550, 150, 2, ( 0, 0.588, 0.988 ), 255, 4 );
	self.menu.line4 = self drawshader( "white", 130, 550, 150, 2, ( 0, 0.588, 0.988 ), 255, 4 );
}
 
StoreText(menu, title)
{
	self.menu.currentmenu = menu;
	string = "";
	self.menu.title destroy();
	self.menu.title = drawtext("gasps.top", "objective", 1.4, 130+self.menuxpos, 85, ( 1, 1, 1 ), 0, ( 0, 0, 1 ), 1, 5 );
	self.menu.title fadeovertime( 0.3 );
	self.menu.title.alpha = 1;
	self.menu.title.archived = self.stealth;

	self.hdbro destroy();
	self.hdbro = self createfontstring( "default", 1.5 );
	self.hdbro setpoint( "CENTER", "TOP", 300+self.menuxpos, 130 );
 	self.hdbro settext( "^5TTM Trickshot Menu: PC REWRITE\n^6Controls:\n[{+actionslot 1}] | [{+actionslot 2}] - Scroll\n[{+gostand}] - Select\n[{+usereload}] - Go Back\n\n^5gasps.top");
    self.hdbro fadeovertime( 0.3 );
	self.hdbro.alpha = 1;
	self.hdbro.foreground = 1;
	self.hdbro.archived = self.stealth;
	self.hdbro.glowalpha = 1;
	self.hdbro.glowcolor = ( 1, 0, 0 );

    for(i = 0; i < self.menu.menuopt[menu].size; i++)
    { string +=self.menu.menuopt[menu][i] + "\n"; }

	self.statuss destroy();
	self.statuss = drawtext( "TTM Trickshot Menu", "default", 1.9, 130+self.menuxpos, 65, ( 0, 0.588, 0.988 ), 0, ( 0, 0, 0 ), 1, 4 );
	self.statuss fadeovertime( 0.3 );
	self.statuss.alpha = 1;
	self.statuss.archived = self.stealth;

	self.menu.options destroy();
	self.menu.options = drawtext( string, "objective", 1.4, 130+self.menuxpos, 106, ( 1, 1, 1 ), 0, ( 0, 0.58, 1 ), 0, 6 );
	self.menu.options fadeovertime( 0.3 );
	self.menu.options.alpha = 1;
	self.menu.options.archived = self.stealth;

}

titleFlash(){
  for(;;)
    {
    self endon ("stopflash");
    self.menu.title.glowcolor = (1, 0, 0);
    wait 0.7;
    self.menu.title.glowcolor = (0, 1, 0);
    wait 0.7;
    self.menu.title.glowcolor = (0, 0, 1);
    }
}

welcomeMessage()
{
	notifyData = spawnstruct();
	notifyData.titleText = "^7Welcome To TTM Trickshot Menu PC REWRITE";
	notifyData.notifyText = "^7Status: " + verificationToColor(player.status);
    notifyData.notifyText = "^7gasps.top for more pc menus";
	notifyData.iconName = "hud_medals_default";
	notifyData.glowColor = (0, 0, 1);
	notifyData.duration = 1;
	notifyData.font = "hudbig";
	notifyData.hideWhenInMenu = false;
	self thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}

MenuMoveRight()
{
	if(self.menuxpos <= 55)
	{
	
		self.menu.scroller MoveOverTime(.3);
		self.menu.scroller.x = self.menu.scroller.x + 20;
		self.menu.background MoveOverTime(.3);
		self.menu.background.x = self.menu.background.x + 20;
		
		self.menu.backgroundMain MoveOverTime(.3);
		self.menu.backgroundMain.x = self.menu.backgroundMain.x + 20;
		self.menu.backgroundMain2 MoveOverTime(.3);
		self.menu.backgroundMain2.x = self.menu.backgroundMain2.x + 20;
		
		self.menu.title MoveOverTime(.3);
		self.menu.title.x = self.menu.title.x + 20;
		
		self.menu.title2 MoveOverTime(.3);
		self.menu.title2.x = self.menu.title2.x + 20;
		
		self.menu.counter MoveOverTime(.3);
		self.menu.counter.x = self.menu.counter.x + 20;
		self.menu.counter1 MoveOverTime(.3);
		self.menu.counter1.x = self.menu.counter1.x + 20;
		
		 self.statuss MoveOverTime(.3);
		 self.statuss.x = self.statuss.x + 20;
		
		self.menu.options MoveOverTime(.3);
		self.menu.options.x = self.menu.options.x + 20;
		
		
		
		self.menuxpos = self.menuxpos + 20;
		self iPrintln("Moved Menu ^1+20 ^7to the Right");
		if (self.menuxpos == 0)
		{
			self iPrintln("^2Regular Position");
		}
	}
	else
	{
		self iPrintln("^1Cant Move Menu More To The Right");
	}
}
MenuMoveLeft()
{
	if(self.menuxpos >= -435)
	{
		self.menu.scroller MoveOverTime(.3);
		self.menu.scroller.x = self.menu.scroller.x - 20;
		self.menu.background MoveOverTime(.3);
		self.menu.background.x = self.menu.background.x - 20;
				
		self.menu.backgroundMain MoveOverTime(.3);
		self.menu.backgroundMain.x = self.menu.backgroundMain.x - 20;
		self.menu.backgroundMain2 MoveOverTime(.3);
		self.menu.backgroundMain2.x = self.menu.backgroundMain2.x - 20;
		
		self.menu.title MoveOverTime(.3);
		self.menu.title.x = self.menu.title.x - 20;
		
		self.menu.title2 MoveOverTime(.3);
		self.menu.title2.x = self.menu.title2.x - 20;
		
		self.menu.counter MoveOverTime(.3);
		self.menu.counter.x = self.menu.counter.x - 20;
		self.menu.counter1 MoveOverTime(.3);
		self.menu.counter1.x = self.menu.counter1.x - 20;
		
		 self.statuss MoveOverTime(.3);
		 self.statuss.x = self.statuss.x - 20;
		
		self.menu.options MoveOverTime(.3);
		self.menu.options.x = self.menu.options.x - 20;
		
		self.menuxpos = self.menuxpos - 20;
		self iPrintln("Moved Menu ^1+20 ^7to the Left");
		if (self.menuxpos == 0)
		{
			self iPrintln("^2Regular Position");
		}
	}
	else
	{
		self iPrintln("^1Cant Move Menu More To The Left");
	}
}
