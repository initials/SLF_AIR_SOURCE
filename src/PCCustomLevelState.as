/*
 * Copyright (c) 2011-2012 Initials Video Games
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */ 

package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX
	
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	
	
	public class PCCustomLevelState extends FlxState
	{
		[Embed(source = "../data/logo.png")] private var ImgLogo:Class;
		[Embed(source = "../data/largeCrate.png")] private var ImgLargeCrate:Class;
		[Embed(source = "../data/level1/palettes.png")] private var ImgPalettes:Class;
		[Embed(source = "../data/smallCrate.png")] private var ImgSmallCrate:Class;
		[Embed(source = "../data/smallSugarBag.png")] private var ImgSmallSugarBag:Class;
		[Embed(source = "../data/sodaPack.png")] private var ImgSodaPack:Class;
		[Embed(source = "../data/sugarBags.png")] private var ImgSugarBags:Class;
		[Embed(source = "../data/tiles.png")] private var ImgTiles:Class;		
		[Embed(source = "../data/sfx_128/Blip_Select.mp3")] protected var SndBlip:Class;
		
		[Embed(source = "../data/level3/bookCase.png") ] private var ImgMgmt1:Class;
		[Embed(source = "../data/level3/filingCab1.png") ] private var ImgMgmt2:Class;
		[Embed(source = "../data/level3/plant2.png") ] private var ImgMgmt3:Class;
		[Embed(source = "../data/level3/level3_desk1.png") ] private var ImgMgmt4:Class;
		
		[Embed(source = "../data/level2/level2_FMG3.png") ] private var ImgFactory1:Class;
		[Embed(source = "../data/level2/level2_MG2.png") ] private var ImgFactory2:Class;
		[Embed(source = "../data/level2/level2_tank.png") ] private var ImgFactory3:Class;
		
		[Embed(source = "../data/sfx_128/ping.mp3")] protected var SndPing:Class;		
		[Embed(source = "../data/sfx_128/ping2.mp3")] protected var SndPing2:Class;		
		[Embed(source = "../data/level1/level1_bgSmoothGrad.png") ] private var level1_bgSmoothGrad:Class;
		[Embed(source = "../data/level2/level2_gradient.png") ] private var level2_gradient:Class;
		[Embed(source = "../data/level3/level3_gradient.png") ] private var level3_gradient:Class;
		
		
		[Embed(source = '../data/SLF_levelEditor/level1.oel', mimeType = 'application/octet-stream')] private var Level1:Class;
		
		//	Test specific variables
		private var slide:CenterSlideFX;
		private var scratch:FlxSprite;
		private var glitchAmount:int;
		private var bg:FlxTileblock;
		
		public var ground:FlxTileblock;
		
		public var collideGroupWH:FlxGroup;
		public var collideGroupFTRY:FlxGroup;
		public var collideGroupMGMT:FlxGroup;
		
		public var playBtn:FlxButton ;
		public var playBuiltInLevelsBtn:FlxButton ;
		public var loadLevelBtn:FlxButton;
		public var levelTypeBtn:FlxButton;
		public var backBtn:FlxButton;
		
		public var txtLevel:FlxText;
		public var txtPlayersNo:FlxText;
		
		
		//FileReference Class well will use to load data
		private var fr:FileReference;

		//File types which we want the user to open
		private static const FILE_TYPES:Array = [new FileFilter("Ogmo Level File", "*.oel")];
		
		public var currentLevel:FlxText;
		public var info:FlxText;
		
		public var ping:FlxSound;
		
		public var buttonsGroup:FlxGroup;

		//called when the user clicks the load file button
		private function onLoadFileClick():void
		{
			//create the FileReference instance
			fr = new FileReference();

			//listen for when they select a file
			fr.addEventListener(Event.SELECT, onFileSelect);

			//listen for when then cancel out of the browse dialog
			fr.addEventListener(Event.CANCEL,onCancel);

			//open a native browse dialog that filters for text files
			fr.browse(FILE_TYPES);
		}

		/************ Browse Event Handlers **************/

		//called when the user selects a file from the browse dialog
		private function onFileSelect(e:Event):void
		{
			//listen for when the file has loaded
			fr.addEventListener(Event.COMPLETE, onLoadComplete);

			//listen for any errors reading the file
			fr.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);

			//load the content of the file
			fr.load();
			
			
			
		}

		//called when the user cancels out of the browser dialog
		private function onCancel(e:Event):void
		{
			trace("File Browse Canceled");
			fr = null;
		}

		/************ Select Event Handlers **************/

		//called when the file has completed loading
		private function onLoadComplete(e:Event):void
		{
			//get the data from the file as a ByteArray
			var data:ByteArray = fr.data;
			
			Registry.level = XML(data); 

			//read the bytes of the file as a string and put it in the
			//textarea
			//outputField.text = data.readUTFBytes(data.bytesAvailable);
			
			currentLevel.text = fr.name;
			
			Registry.levelName = fr.name;
			
			//clean up the FileReference instance

			fr = null;
			
			playBtn.visible = true;
		}

		//called if an error occurs while loading the file contents
		private function onLoadError(e:IOErrorEvent):void
		{
			trace("Error loading file : " + e.text);
		}
		
		public function bgColor(): void {
			if (Registry.levelType==1) {
				FlxG.bgColor = 0xffF8CB8F;
				bg.loadTiles(level1_bgSmoothGrad, 1, 512, 0);
				ground.loadTiles(Registry.ImgLevel1Tiles, 10, 10, 0,true);
				
				for (var i:int = 0; i < buttonsGroup.length; i++) { 
					(buttonsGroup.members[i] as FlxButton).color = Registry.WAREHOUSE_PURPLE;					
				}
								
				collideGroupWH.visible = true;
				collideGroupFTRY.visible = false;
				collideGroupMGMT.visible = false;
				
				currentLevel.color = 0x8000FF;
				info.color = 0x8000FF;
				
				
			}
			if (Registry.levelType==2) {
				FlxG.bgColor = 0xff92D588;
				bg.loadTiles(level2_gradient, 1, 512, 0);
				ground.loadTiles(Registry.ImgLevel2Tiles, 10, 10, 0, true);		
				
				for (i=0; i < buttonsGroup.length; i++) { 
					(buttonsGroup.members[i] as FlxButton).color = Registry.FACTORY_GREEN;					
				}				
				collideGroupWH.visible = false;
				collideGroupFTRY.visible = true;
				collideGroupMGMT.visible = false;	
				
				currentLevel.color = 0xD9FBB7;
				info.color = 0xD9FBB7;
				
			}
			if (Registry.levelType==3) {
				FlxG.bgColor = 0xffE3C179;
				bg.loadTiles(level3_gradient, 1, 512, 0);
				ground.loadTiles(Registry.ImgLevel3Tiles, 10, 10, 0, true);		

				for (i=0; i < buttonsGroup.length; i++) { 
					(buttonsGroup.members[i] as FlxButton).color = Registry.MGMT_BROWN;					
				}				
				collideGroupWH.visible = false;
				collideGroupFTRY.visible = false;
				collideGroupMGMT.visible = true;				
				
				currentLevel.color = 0x804000;
				info.color = 0x804000;		
			}	
			
		}
		
		
		override public function create():void
		{
			
			ping = new FlxSound();
			ping.loadEmbedded(SndBlip);
			ping.volume = 0.5;
			
			
			FlxG.bgColor = 0xffF8CB8F;
			
			bg = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
			add(bg);
			
/*			//	Make the gradient retro looking and "chunky" with the chucnkSize parameter (here set to 4)
			var gradient2:FlxSprite = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xffcac5ac, 0xffdedbc3 , 0xffdfdcc4], 10 ); //0xffd6d3ba
			gradient2.x = 0;
			gradient2.y = 0;
			add(gradient2);*/
			
			


			
			
/*			var inst:FlxText = new FlxText(0, 4, FlxG.width, "Click to change.");
			inst.size = 8;
			inst.alignment = "left";
			add(inst);

			txtLevel = new FlxText(0, 14, FlxG.width, "Level Type: Warehouse");
			txtLevel.size = 8;
			txtLevel.alignment = "left";
			add(txtLevel);
			
			txtPlayersNo = new FlxText(0, 24, FlxG.width, "Players: 1");
			txtPlayersNo.size = 8;
			txtPlayersNo.alignment = "left";
			add(txtPlayersNo);
			
			if (Registry.playersNo==2) {
				Registry.playersNo = 2;
				txtPlayersNo.text = "Players: 2";
			}
			else  {
				Registry.playersNo = 1;
				txtPlayersNo.text = "Players: 1";
			}*/
				
/*			if (Registry.levelType == 2) {
				txtLevel.text = "Level Type: Factory";
				Registry.levelType = 2;
			}
			else if (Registry.levelType == 3) {
				txtLevel.text = "Level Type: Management";
				Registry.levelType = 3;
			}			
			else
				Registry.levelType = 1;*/
			
			
/*			collideGroupWH = new FlxGroup();
			collideGroupFTRY = new FlxGroup();
			collideGroupMGMT = new FlxGroup();
			
			for ( var i:int = 0; i < 3; i++) {
				var sugarBag:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgSugarBags);
				sugarBag.acceleration.y = 150;
				collideGroupWH.add(sugarBag);
				
				var palettes:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgPalettes);
				palettes.acceleration.y = 160;
				collideGroupWH.add(palettes);
				
				var largeCrate:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgLargeCrate);
				largeCrate.acceleration.y = 160;
				collideGroupWH.add(largeCrate);
			}
			
			add(collideGroupWH);

			for ( var i:int = 0; i < 3; i++) {
				var sugarBag:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgFactory1);
				sugarBag.acceleration.y = 150;
				collideGroupFTRY.add(sugarBag);
				
				var palettes:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgFactory2);
				palettes.acceleration.y = 160;
				collideGroupFTRY.add(palettes);
				
				var largeCrate:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgFactory3);
				largeCrate.acceleration.y = 160;
				collideGroupFTRY.add(largeCrate);
			}
			
			add(collideGroupFTRY);
			
			for ( var i:int = 0; i < 3; i++) {
				var sugarBag:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgMgmt1);
				sugarBag.acceleration.y = 150;
				collideGroupMGMT.add(sugarBag);
				
				var palettes:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgMgmt2);
				palettes.acceleration.y = 160;
				collideGroupMGMT.add(palettes);
				
				var largeCrate:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgMgmt3);
				largeCrate.acceleration.y = 160;
				collideGroupMGMT.add(largeCrate);
				
				var largeCrate:FlxSprite = new FlxSprite(i * 60 * FlxG.random()*10, -i * 50 * FlxG.random()*10, ImgMgmt4);
				largeCrate.acceleration.y = 160;
				collideGroupMGMT.add(largeCrate);				
			}
			
			add(collideGroupMGMT);	
			
			
			collideGroupFTRY.visible = false;
			collideGroupMGMT.visible = false;*/
			
			ground = new FlxTileblock(0, FlxG.height-30, FlxG.width, 30);
			ground.loadTiles(Registry.ImgLevel1Tiles, 10, 10, 0,true);
			add(ground);			
			
			collideGroupWH = new FlxGroup();
			collideGroupFTRY = new FlxGroup();
			collideGroupMGMT = new FlxGroup();
			
			var sugarBag:FlxSprite = new FlxSprite(60, ground.y, ImgSugarBags);
			collideGroupWH.add(sugarBag);
			sugarBag.y = ground.y - sugarBag.height;
			
			var palettes:FlxSprite = new FlxSprite(160, ground.y, ImgPalettes);
			collideGroupWH.add(palettes);
			palettes.y = ground.y - palettes.height;
			
			var largeCrate:FlxSprite = new FlxSprite(260, ground.y, ImgLargeCrate);
			collideGroupWH.add(largeCrate);
			largeCrate.y = ground.y - largeCrate.height;
			
			
			add(collideGroupWH);

			var tank1:FlxSprite = new FlxSprite(130, FlxG.height/4, ImgFactory1);
			collideGroupFTRY.add(tank1);
			
			var tank2:FlxSprite = new FlxSprite(0,FlxG.height/4, ImgFactory2);
			collideGroupFTRY.add(tank2);
			
			var tank3:FlxSprite = new FlxSprite(430, FlxG.height/4, ImgFactory3);
			collideGroupFTRY.add(tank3);
		
		
			add(collideGroupFTRY);
		
			var m1:FlxSprite = new FlxSprite(20, ground.y, ImgMgmt1);
			collideGroupMGMT.add(m1);
			m1.y = ground.y - m1.height;
			
			var m3:FlxSprite = new FlxSprite(360, ground.y, ImgMgmt3);
			collideGroupMGMT.add(m3);
			m3.y = ground.y - m3.height;
			
			var m4:FlxSprite = new FlxSprite(260, ground.y, ImgMgmt4);
			collideGroupMGMT.add(m4);
			m4.y = ground.y - m4.height;
			
			
			add(collideGroupMGMT);	
			
			
			collideGroupFTRY.visible = false;
			collideGroupMGMT.visible = false;
			
			
			
			
			
			
			info = new FlxText(0,FlxG.height/2-120,FlxG.width,"Current level:");
			info.size = 16;
			info.alignment = "center";
			info.color = 0x8000FF;
			add(info);
			
			currentLevel = new FlxText(0,FlxG.height/2-100,FlxG.width,"No level loaded.");
			currentLevel.size = 16;
			currentLevel.alignment = "center";
			currentLevel.color = 0x8000FF;

			add(currentLevel);
			
			if (Registry.level != null) {
				currentLevel.text = ("Level loaded: "+Registry.levelName);
			}
			
			buttonsGroup = new FlxGroup();
			
			levelTypeBtn = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 - 30, "Level Type", this.changeLevelType);
			levelTypeBtn.soundOver = ping;
			levelTypeBtn.color = 0xC082FF;
			levelTypeBtn.label.color = 0xffffff;
			buttonsGroup.add(levelTypeBtn);
			
			levelTypeBtn.status = FlxButton.HIGHLIGHT;
			
			loadLevelBtn = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 + 0, "Load Level", this.onLoadFileClick);
			//loadLevelBtn.color = 0xFFBA75;
			loadLevelBtn.soundOver = ping;
			loadLevelBtn.color = 0xC082FF;
			loadLevelBtn.label.color = 0xffffff;
			buttonsGroup.add(loadLevelBtn);
			
			playBtn = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 + 30, "Play", this.switchStates);
			playBtn.soundOver = ping;
			playBtn.color = 0xC082FF;
			playBtn.label.color = 0xffffff;
			buttonsGroup.add(playBtn);	
			
			backBtn = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 + 60, "Back", this.onQuit);
			backBtn.soundOver = ping;
			backBtn.color = 0xC082FF;
			backBtn.label.color = 0xffffff;
			buttonsGroup.add(backBtn);		
			
			
			add(buttonsGroup);
			
			this.bgColor();
			
			
		}

		override public function update():void
		{
			

			if (!fading && !FlxG.mouse.visible)
				this.handleButtons();
			
			if ((FlxG.keys.justPressed(Registry.homeKey) || FlxG.joystick.j1ButtonBackJustPressed) && !fading) {
				onQuit();			
				
			}
			
			
			FlxG.collide(collideGroupWH,ground);
			FlxG.collide(collideGroupFTRY,ground);
			FlxG.collide(collideGroupMGMT,ground);
			
			super.update();
			
		}
		
		
		public function handleButtons():void {
			if (FlxG.keys.justPressed(Registry.p1Down)  || FlxG.joystick.j1Stick1DownJustPressed ) {
				currentButton++;
				FlxG.play(Registry.SndBlip, 0.3);
			}
			
			else if (FlxG.keys.justPressed(Registry.p1Up) || FlxG.joystick.j1Stick1UpJustPressed ) {
				currentButton--;
				FlxG.play(Registry.SndBlip, 0.3);
			}
			
			if (FlxG.keys.justPressed(Registry.p1Action) ||  FlxG.keys.justPressed(Registry.p1Switch) || FlxG.keys.justPressed(Registry.p1Jump) || FlxG.joystick.j1ButtonAJustPressed  ) {
				FlxG.play(Registry.SndPing,Registry.pingVolume);
				this.beginFade();
			}
			
			if (currentButton < 0) {
				currentButton = buttonsGroup.length-1;
			}
			else if (currentButton > buttonsGroup.length-1) {
				currentButton = 0;
			}
			
			for (var i:int = 0; i < buttonsGroup.length; i++) { 
				if (i == currentButton) {
					(buttonsGroup.members[i] as FlxButton).status = FlxButton.HIGHLIGHT;		
				}
				else {
					(buttonsGroup.members[i] as FlxButton).status = FlxButton.NORMAL;
				}
			}
		}
		
		protected function beginFade():void
		{
			if (currentButton>=0) {
				switch(currentButton) {
					case 0:
						this.changeLevelType();
						break;
					case 1:
						this.onLoadFileClick();
						break;
					case 2:
						this.switchStates();
						break;
					case 3:
						this.onQuit();
						break;		
						
				}
			}
			
		}
		
		
		public function changeLevelType():void {
			/* Change level type */
			FlxG.play(SndBlip, 0.75, false, true);
			if (Registry.levelType ==1 ) 
			{
				Registry.levelType = 2;
				ground.loadTiles(Registry.ImgLevel2Tiles, 10, 10, 0,true);

				
			}
			else if (Registry.levelType ==2)
			{
				Registry.levelType = 3;
				ground.loadTiles(Registry.ImgLevel3Tiles, 10, 10, 0,true);
		
			}
			else if (Registry.levelType ==3 )
			{
				Registry.levelType = 1;
				ground.loadTiles(Registry.ImgLevel1Tiles, 10, 10, 0, true);		
			}
			
			bgColor();
		}

		
/*		protected function beginFade():void
		{
			fading = true;
			FlxG.fade(0xff000000, 0.4, completeFade);
			
		}
		
		protected function completeFade():void
		{
			switch(currentButton) {
				case 0:
					FlxG.switchState(new PCLevelSelectState());
					break;
				case 1:
					FlxG.switchState(new PCOptionsState());
					break;		
				case 2:
					FlxG.switchState(new PCHelpState());
					break;
				case 3:
					FlxG.switchState(new PCCreditsState());
					break;	
				case 4:
					FlxG.switchState(new PCCustomLevelState());
					break;						
			}
		}*/			
		
		
		public function switchStates():void {
			//if (currentLevel.text == "No level loaded.") {
			if (Registry.level == null) {
				FlxG.shake(0.01, 0.1);
			}
			else {			
				//FlxG.play(SndPing, 0.75, false, true);
				Registry.isPlayingDemo = false;
				Registry.isPlayingCustomLevel = true;
				Registry.demoLevel = 1;
				FlxG.switchState(new PCPlayState());
			}
		}
		
		public function playBuiltInLevel():void {
			//FlxG.play(SndPing2, 0.75, false, true);
			Registry.level = XML(new Level1); 
			Registry.levelName = "Demo Level 1";
			Registry.levelType = 1;
			Registry.isPlayingDemo = true;
			Registry.demoLevel = 1;
			FlxG.switchState(new PlayState());
			
		}
		
		protected function onQuit():void
		{
			FlxG.switchState(new PCMenuState());
		}		
		

		override public function destroy():void
		{
			//	Important! Clear out the plugin, otherwise resources will get messed right up after a while
			FlxSpecialFX.clear();
			
			super.destroy();
		}

		
	}
}
